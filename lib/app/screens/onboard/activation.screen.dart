// 🐦 Flutter imports:

// � Package imports:
import 'package:at_base2e15/at_base2e15.dart';
// � Flutter imports:
import 'package:at_server_status/at_server_status.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

// 🌎 Project imports:
import '../../../core/services/app.service.dart';
import '../../../core/services/passman.env.dart';
import '../../../core/services/sdk.services.dart';
import '../../../meta/components/toast.dart';
import '../../../meta/extensions/logger.ext.dart';
import '../../../meta/models/key.model.dart';
import '../../../meta/models/value.model.dart';
import '../../../meta/notifiers/new_user.notifier.dart';
import '../../../meta/notifiers/user_data.notifier.dart';
import '../../constants/keys.dart';
import '../../constants/page_route.dart';

class ActivateAtSignScreen extends StatefulWidget {
  const ActivateAtSignScreen({Key? key}) : super(key: key);

  @override
  State<ActivateAtSignScreen> createState() => _ActivateAtSignScreenState();
}

class _ActivateAtSignScreenState extends State<ActivateAtSignScreen>
    with SingleTickerProviderStateMixin {
  final AppLogger _logger = AppLogger('ActivateAtSignScreen');
  SdkServices sdk = SdkServices.getInstance();
  final PassKey _passKey = Keys.profilePicKey;
  AtStatus? status;
  String content = 'Fetching @sign...';
  late final AnimationController controller = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  );
  late final CurvedAnimation _curve = CurvedAnimation(
    parent: controller,
    curve: Curves.easeOut,
  );
  late final Animation<double> _smallDiscAnimation = Tween<double>(
    begin: 0.0,
    end: 75,
  ).animate(_curve);
  late final Animation<double> _mediumDiscAnimation = Tween<double>(
    begin: 0.0,
    end: 137.5,
  ).animate(_curve);
  late final Animation<double> _bigDiscAnimation = Tween<double>(
    begin: 0.0,
// 🐦 Flutter imports:
    end: 200,
  ).animate(_curve);
  late final Animation<double> _alphaAnimation = Tween<double>(
    begin: 0.30,
    end: 0.0,
  ).animate(controller);

  Future<void> _statusListener(_) async {
    if (controller.status == AnimationStatus.completed) {
      if (mounted) {
        controller.reset();
        await controller.forward();
      }
    }
  }

  @override
  void initState() {
    _passKey
      ..sharedWith = context.read<NewUser>().getQrData.atSign
      ..sharedBy = context.read<NewUser>().getQrData.atSign
      ..value = Value(
        value: Base2e15.encode(context.read<NewUser>().newUserData['img']),
        type: 'profilepic',
      );
    Future<void>.microtask(
      () async {
        await AppServices.checkPermission(<Permission>[
          Permission.storage,
          Permission.photos,
          Permission.manageExternalStorage
        ]);
        controller.addStatusListener(_statusListener);
        String _atSign = context.read<NewUser>().getQrData.atSign;
        content = 'fetching $_atSign status...';
        bool _keySaved = false;
        if (mounted) {
          controller.reset();
          await controller.forward();
        }
        status = await AppServices.sdkServices.getAtSignStatus(_atSign);
        setState(() {});
        if (status?.serverStatus != ServerStatus.activated) {
          setState(() {
            content = 'Activating $_atSign...';
          });
          bool activationResponse = await sdk.actiavteAtSign(
              _atSign, context.read<UserData>().atOnboardingPreference);
          _logger.finer('$_atSign activation response : $activationResponse');
          context.read<UserData>().authenticated = activationResponse;
          if (activationResponse) {
            status = await AppServices.sdkServices.getAtSignStatus(_atSign);
            content = 'Activated $_atSign.\nPolishing your account...';
            _logger.finer('Activated $_atSign. Polishing your account...');
            bool _propicUpdated = await sdk.put(_passKey);
            if (_propicUpdated) {
              await AppServices.startMonitor();
              context.read<UserData>().currentAtSign = _atSign;
              context.read<UserData>().currentProfilePic =
                  context.read<NewUser>().newUserData['img'];
              _logger.finer('profile pic updated');
            } else {
              _logger.severe('profile pic not updated');
              showToast(_scaffoldKey.currentContext, 'Failed to updated default profile pic',
                  isError: true);
            }
            await AppServices.sdkServices.put(
              Keys.adminKey..value!.value = _atSign.replaceAll('@', '') == PassmanEnv.reportAtsign,
            );
            context.read<UserData>().isAdmin =
                _atSign == PassmanEnv.reportAtsign;
            _keySaved = await AppServices.saveAtKeys(
                _atSign,
                context.read<UserData>().atOnboardingPreference.downloadPath!,
                MediaQuery.of(context).size);
            setState(() {});
            await Future<void>.delayed(
              const Duration(milliseconds: 2500),
              () async {
                if (mounted) {
                  showToast(
                      _scaffoldKey.currentContext,
                      _keySaved
                          ? 'AtKeys saved successfully'
                          : 'Failed to save atKeys file.',
                      isError: !_keySaved);
                  await AppServices.deleteAtKeysFiles(context
                      .read<UserData>()
                      .atOnboardingPreference
                      .downloadPath!);
                }
                await AppServices.startMonitor();

                await Navigator.pushNamedAndRemoveUntil(
                  context,
                  PageRouteNames.setMasterPassword,
                  ModalRoute.withName(PageRouteNames.loginScreen),
                );
              },
            );
          } else {
            status = status?..rootStatus = RootStatus.error;
            content = 'Failed to activate $_atSign.';
            _logger.severe('Failed to activate $_atSign.');
            setState(() {});
            Future<void>.delayed(const Duration(milliseconds: 2000), () {
              if (mounted) {
                Navigator.of(context).pop();
                return;
              }
            });
          }
        } else if (status?.serverStatus == ServerStatus.activated) {
          content = '$_atSign is already activated.';
          _logger.warning('$_atSign is already activated.');
          setState(() {});
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            AnimatedBuilder(
              animation: _alphaAnimation,
              child: Image.memory(context.read<NewUser>().newUserData['img'],
                  height: 70),
              builder: (BuildContext context, Widget? wChild) {
                BoxDecoration decoration = BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: waveColors,
                    width: 3,
                  ),
                  color: waveColors,
                );
                return SizedBox(
                  height: 200,
                  width: 200,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      AnimatedBuilder(
                        animation: _bigDiscAnimation,
                        builder: (BuildContext context, Widget? widget) {
                          num size = _bigDiscAnimation.value.clamp(
                            0.0,
                            double.infinity,
                          );
                          return Container(
                            height: size as double?,
                            width: size as double?,
                            decoration: decoration,
                          );
                        },
                      ),
                      AnimatedBuilder(
                        animation: _mediumDiscAnimation,
                        builder: (BuildContext context, Widget? widget) {
                          num size = _mediumDiscAnimation.value.clamp(
                            0.0,
                            double.infinity,
                          );
                          return Container(
                            height: size as double?,
                            width: size as double?,
                            decoration: decoration,
                          );
                        },
                      ),
                      AnimatedBuilder(
                        animation: _smallDiscAnimation,
                        builder: (BuildContext context, Widget? widget) {
                          num size = _smallDiscAnimation.value.clamp(
                            0.0,
                            double.infinity,
                          );
                          return Container(
                            height: size as double?,
                            width: size as double?,
                            decoration: decoration,
                          );
                        },
                      ),
                      wChild!,
                    ],
                  ),
                );
              },
            ),
            Text(
              content,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color get waveColors => status?.serverStatus == ServerStatus.ready ||
          status?.serverStatus == ServerStatus.activated
      ? Theme.of(context).primaryColor.withOpacity(
            _alphaAnimation.value.clamp(
              0.0,
              1.0,
            ),
          )
      : status?.serverStatus == ServerStatus.teapot
          ? Colors.yellow[800]!.withOpacity(
              _alphaAnimation.value.clamp(
                0.0,
                1.0,
              ),
            )
          : status?.serverStatus == ServerStatus.error
              ? Colors.red.withOpacity(
                  _alphaAnimation.value.clamp(
                    0.0,
                    1.0,
                  ),
                )
              : Theme.of(context).primaryColor.withOpacity(
                    _alphaAnimation.value.clamp(
                      0.0,
                      1.0,
                    ),
                  );
}
