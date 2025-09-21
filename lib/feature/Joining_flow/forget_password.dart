import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/core/helper/my_navgator.dart';
import '../../core/core/utils/appColor.dart';
import '../../core/core/utils/appStyles.dart';
import '../../core/core/widgets/CustomButton.dart';
import '../../core/core/widgets/CustomTextField.dart';
import '../../core/core/widgets/customAppBar.dart';
import 'Otp_to_Update_Password_screen.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CustomAppBar(title: "تغير كلمة المرور",),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 283.w, // أو قللها شوية لو عايز مسافة من اليسار
                child: Text(
                  "ادخل رقم الهاتف / البريد الالكتروني لاستعادة كلمة المرور",
                  style: AppStyles.textStyle14w400FF.copyWith(color: AppColors.kgray),
                  textAlign: TextAlign.right, // ✅ النص من اليمين
                  softWrap: true,             // ✅ يلف تلقائي
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height/30,),
        CustomTextField(hintText: "", controller: TextEditingController()),
        Spacer(flex: 8,),
        CustomButton(
          text: "تاكيد",
          onPressed: (){MyNavigator.goTo(context, OtpToUpdatePasswordScreen(emailOrPhone: ''));},
          height: 48.h,
          width: 335.w,
        ),
        Spacer(flex: 1,),
      ],),
    );
  }
}