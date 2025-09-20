import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/core/utils/appColor.dart';
import '../../core/core/utils/appStyles.dart';
class SplashBackgroundWidget extends StatelessWidget {
  final double textTop;
  final double textLeft;
  final double textWidth;
  final double textHeight;
  final String text;
  final double eazyTop;
  final double eazyLeft;
  final double eazyWidth;
  final double eazyHeight;

  const SplashBackgroundWidget({
    super.key,
    required this.textTop,
    required this.textLeft,
    required this.textWidth,
    required this.textHeight,
    this.text = "!مدرسة في جيبك",
    this.eazyTop = 100,
    this.eazyLeft = 0,
    this.eazyWidth = 200,
    this.eazyHeight = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset("assets/images/splash.jpg"),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF002B4F),
                  Color.fromRGBO(0, 43, 79, 0.79),
                  Color(0xFF002B4F),
                ],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
          ),
        ),
        Positioned(
          top: eazyTop.h,
          left: eazyLeft.w,
          width: eazyWidth.w,
          height: eazyHeight.h,
          child: RichText(
            text: TextSpan(
              style: AppStyles.textStyleFingerPaint114,
              children: [
                const TextSpan(text: "E", style: TextStyle(color: AppColors.blue)),
                const TextSpan(text: "a", style: TextStyle(color: AppColors.white)),
                const TextSpan(text: "z", style: TextStyle(color: AppColors.blue)),
                const TextSpan(text: "y", style: TextStyle(color: AppColors.orange)),
              ],
            ),
          ),
        ),
        Positioned(
          top: textTop.h,
          left: textLeft.w,
          width: textWidth.w,
          height: textHeight.h,
          child: Text(
            text,
            style: AppStyles.textStyle18w600.copyWith(
              color: AppColors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
