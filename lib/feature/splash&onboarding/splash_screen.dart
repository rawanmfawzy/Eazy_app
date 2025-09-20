import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../core/core/helper/my_navgator.dart';
import 'background.dart';
import 'onboarding1_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 10), () {
        MyNavigator.goTo(
          context,
          const OnBoarding1(),
          type: NavigatorType.pushReplacement,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SplashBackgroundWidget(
            textTop: 488.h,
            textLeft: 124.w,
            textWidth: 135.w,
            textHeight: 24.h,
            text: "!مدرسة في جيبك",
            eazyTop: 340.h,
            eazyLeft: 51.w,
            eazyWidth: 291.w,
            eazyHeight: 172.h,
          ),
          Positioned(
            top: 750.h,
            left: 183.w,
            width: 27.w,
            height: 27.h,
            child: const SpinKitFadingCircle(
              color: Colors.white,
              size: 27.0,
            ),
          ),
        ],
      ),
    );
  }
}
