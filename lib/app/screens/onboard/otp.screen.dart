// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:provider/provider.dart';

// 🌎 Project imports:
import '../../../core/services/app.service.dart';
import '../../../meta/components/forms/otp.form.dart';
import '../../../meta/components/toast.dart';
import '../../../meta/models/freezed/qr.model.dart';
import '../../../meta/notifiers/new_user.notifier.dart';
import '../../../meta/notifiers/user_data.notifier.dart';
import '../../constants/global.dart';
import '../../constants/page_route.dart';

// 📦 Package imports:

// 🌎 Project imports:

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> with TickerProviderStateMixin {
  late AnimationController controller;
  bool resend = false;
  double progress = 1.0;

  void start() {
    if (controller.isAnimating) {
      controller.stop();
      setState(() => resend = true);
    } else {
      controller.reverse(from: controller.value == 0 ? 1.0 : controller.value);
      setState(() => resend = false);
    }
  }

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(minutes: 5),
    );

    controller.addListener(() {
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          resend = true;
        });
      }
    });
    start();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  if (context.read<NewUser>().newUserData['img'] != null)
                    Image.memory(
                      context.read<NewUser>().newUserData['img'],
                      height: 100,
                    ),
                  Center(
                    child: Text(
                      context.read<NewUser>().newUserData['atSign'] ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  vSpacer(30),
                  Center(
                    child: Text(
                      'We sent code to ${context
                              .read<NewUser>()
                              .newUserData['email']
                              .toString()
                              .substring(0, 4)}****',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  vSpacer(30),
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
              Center(
                child: OtpForm(
                  context: context,
                  onResend: () async {
                    bool mailSent =
                        await AppServices.registerWithMail(<String, String?>{
                      'email': context.read<NewUser>().newUserData['email'],
                      'atsign': context.read<NewUser>().newUserData['atSign']
                    });
                    if (mailSent) {
                      setState(() {
                        resend = false;
                      });
                      controller.reset();
                      start();
                      showToast(_scaffoldKey.currentContext, 'Code resent successfully.');
                    } else {
                      setState(() => resend = true);
                      showToast(_scaffoldKey.currentContext, 'Failed to resend the code.',
                          isError: true);
                    }
                  },
                  onSubmit: () async {
                    String? cram = await AppServices.getCRAM(<String, dynamic>{
                      'email': context.read<NewUser>().newUserData['email'],
                      'atsign': context
                          .read<NewUser>()
                          .newUserData['atSign']
                          .toString()
                          .replaceFirst('@', ''),
                      'otp': context.read<NewUser>().newUserData['otp'],
                      'confirmation': true,
                    });
                    if (cram != null) {
                      context
                          .read<UserData>()
                          .atOnboardingPreference
                          .cramSecret = cram.split(':')[1];
                      context.read<NewUser>().setQrData = QrModel(
                          atSign: cram.split(':')[0],
                          cramSecret: cram.split(':')[1]);
                      showToast(_scaffoldKey.currentContext, 'OTP verified successfully.');
                      await Navigator.pushNamed(
                          context, PageRouteNames.activatingAtSign);
                    } else {
                      showToast(_scaffoldKey.currentContext, 'Invalid OTP.', isError: true);
                    }
                  },
                  resend: resend,
                ),
              ),
            ],
          ),
          Positioned(
            top: 50,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.close_rounded),
              splashRadius: 0.1,
              onPressed: () async => Navigator.pushNamedAndRemoveUntil(
                context,
                PageRouteNames.loginScreen,
                ModalRoute.withName(PageRouteNames.loginScreen),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
