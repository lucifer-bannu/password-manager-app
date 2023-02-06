// 🎯 Dart imports:

//  Package imports:
import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:at_onboarding_flutter/services/onboarding_service.dart';
// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

// 🌎 Project imports:
import '../../core/services/app.service.dart';
import '../../meta/components/toast.dart';
import '../../meta/extensions/logger.ext.dart';
import '../../meta/notifiers/user_data.notifier.dart';
import '../constants/assets.dart';
import '../constants/global.dart';
import '../constants/page_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AppLogger _logger = AppLogger('SplashScreen');
  final OnboardingService _os = OnboardingService.getInstance();
  String? msg;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Future<void> _init({Function? onFailure}) async {
    try {
      String? currentAtSign;
      AtClientPreference? preference;
      bool onboarded = false;
      Map<String, bool?> atSigns =
          await KeyChainManager.getInstance().getAtsignsWithStatus();
      if (atSigns.isNotEmpty) {
        currentAtSign = atSigns.keys.first;
        // TODO: BUG: This is not working, so need to relogin everytime
        // currentAtSign = atSigns.keys.firstWhere(
        //     (String key) => atSigns[key] == true,
        //     orElse: () => throw 'No AtSigns found');
        setState(() => msg = 'Authenticating...');
        context.read<UserData>().currentAtSign = currentAtSign;
        preference = await AppServices.sdkServices.getAtClientPreferences();
        context.read<UserData>().atOnboardingPreference = preference
          ..privateKey = await KeyChainManager.getInstance()
              .getEncryptionPrivateKey(currentAtSign);
        _os.setAtClientPreference = preference;
        onboarded = await _os.onboard();
        context.read<UserData>().authenticated = onboarded;
        if (!onboarded) {
          setState(() => msg = null);
          showToast(_scaffoldKey.currentContext,
              'Auto login failed. Please onboard with at sign again.',
              isError: true);
        }
      } else {
        setState(() => msg = null);
        await Future<void>.delayed(const Duration(milliseconds: 3200));
      }
      _logger.finer('Checking done...');
      setState(() => msg = null);
      if (mounted) {
        await Navigator.pushReplacementNamed(
            context,
            onboarded
                ? PageRouteNames.loadingScreen
                : PageRouteNames.loginScreen);
      }
    } catch (e, s) {
      _logger.severe(e.toString(), e, s);
      if (onFailure != null) {
        onFailure();
      }
      return;
    }
  }

  @override
  void initState() {
    Future<void>.delayed(Duration.zero, () async {
      // if (mounted && MediaQuery.of(context).size.width >= 500) {
      //   await Navigator.pushReplacementNamed(
      //       context, PageRouteNames.mobileDeviceScreen);
      //   return;
      // }
      await _init(onFailure: _init);
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Lottie.asset(
              Assets.logo,
              height: 200,
            ),
          ),
          if (msg != null) vSpacer(30),
          if (msg != null)
            Text(
              msg!,
              style: Theme.of(context).textTheme.bodyText1!,
            ),
        ],
      ),
    );
  }
}
