import 'dart:async';
import 'package:eazy_app/feature/Joining_flow/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../core/core/helper/my_navgator.dart';
import '../../core/core/utils/appColor.dart';
import '../../core/core/utils/appPaddings.dart';
import '../../core/core/utils/appStyles.dart';
import '../../core/core/widgets/CustomButton.dart';
import '../../core/core/widgets/customAppBar.dart';
import 'login_screen.dart';

class OtpScreen extends StatefulWidget {
  final String emailOrPhone;

  const OtpScreen({super.key, required this.emailOrPhone});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  int secondsRemaining = 60;
  bool enableResend = false;
  Timer? timer;

  bool hasError = false;
  String errorMessage = "";

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    otpController.dispose();
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining > 0) {
        setState(() => secondsRemaining--);
      } else {
        setState(() => enableResend = true);
        timer?.cancel();
      }
    });
  }

  void resendCode() {
    setState(() {
      secondsRemaining = 60;
      enableResend = false;
    });
    startTimer();
  }

  void verifyOtp() {
    if (otpController.text.isEmpty || otpController.text.length < 4) {
      setState(() {
        hasError = true;
        errorMessage = "هذا الحقل مطلوب";
      });
    } else if (otpController.text != "1234") {
      setState(() {
        hasError = true;
        errorMessage = "الرمز غير صحيح";
      });
    } else {
      setState(() {
        hasError = false;
        errorMessage = "";
      });
      MyNavigator.goTo(
        context,
        const LoginScreen(),
        type: NavigatorType.pushReplacement,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final minutes = (secondsRemaining ~/ 60).toString().padLeft(2, '0');
    final seconds = (secondsRemaining % 60).toString().padLeft(2, '0');

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.mainPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                onPressed: () {
                  MyNavigator.goTo(
                    context,
                    const SignUpScreen(),
                    type: NavigatorType.pushReplacement,
                  );
                },
              ),
              SizedBox(height: 31.h),
              Padding(
                padding: EdgeInsets.only(left: 258.w),
                child: Text(
                  'كود التحقق',
                  style: AppStyles.textStyle18w400.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
              SizedBox(height: 19.h),
              Padding(
                padding: EdgeInsets.only(left: 50.w),
                child: Text(
                  'من فضلك أدخل رمز التحقق الذي أرسل لك في رسالة\nعلى: ${widget.emailOrPhone}',
                  style: AppStyles.textStyle14w400FF.copyWith(
                    color: AppColors.gray,
                  ),
                ),
              ),
              SizedBox(height: 33.h),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PinCodeTextField(
                      appContext: context,
                      length: 4,
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        if (hasError) {
                          setState(() {
                            hasError = false;
                            errorMessage = "";
                          });
                        }
                      },
                      textStyle: AppStyles.textStyle20w400MA.copyWith(
                        color: AppColors.blue,
                      ),
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(12.r),
                        fieldHeight: 74.h,
                        fieldWidth: 78.w,
                        activeColor: hasError ? Colors.red : AppColors.blue,
                        inactiveColor:
                        hasError ? Colors.red : AppColors.grayOtp,
                        selectedColor: hasError ? Colors.red : AppColors.blue,
                        activeFillColor: Colors.white,
                        inactiveFillColor: Colors.white,
                        selectedFillColor: Colors.white,
                      ),
                      enableActiveFill: true,
                    ),
                    if (hasError) ...[
                      SizedBox(height: 8.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              errorMessage,
                              textAlign: TextAlign.right,
                              style: AppStyles.textStyle14w400FF.copyWith(color: Colors.red),
                            ),
                            SizedBox(width: 4.w),
                            SvgPicture.asset(
                              "assets/icons/warningOtp.svg",
                              width: 16.w,
                              height: 16.h,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              SizedBox(height: 366.h),
              CustomButton(
                text: 'تأكيد',
                onPressed: verifyOtp,
                color: hasError ? Colors.grey : AppColors.blue,
                textStyle: AppStyles.textStyle14w400FF
                    .copyWith(color: AppColors.white),
              ),
              SizedBox(height: 21.h),
              Center(
                child: enableResend
                    ? GestureDetector(
                  onTap: resendCode,
                  child: Text(
                    "إعادة إرسال الكود",
                    style: AppStyles.textStyle14w400FF
                        .copyWith(color: AppColors.blue),
                  ),
                )
                    : RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "إعادة الإرسال بعد ",
                        style: AppStyles.textStyle14w400FF
                            .copyWith(color: AppColors.gray),
                      ),
                      TextSpan(
                        text: "$minutes:$seconds",
                        style: AppStyles.textStyle14w400FF
                            .copyWith(color: AppColors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
