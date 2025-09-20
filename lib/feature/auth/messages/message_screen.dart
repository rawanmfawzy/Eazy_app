import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/core/utils/appColor.dart';
import '../../../core/core/utils/appStyles.dart';
import '../../../core/core/widgets/CustomButton.dart';

class SuccessDialog {
  static void show(
      BuildContext context, {
        required VoidCallback onConfirm,
      }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: SizedBox(
          width: 339.w,
          height: 303.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 114.h),
                Text(
                  "تم حفظ التغييرات بنجاح",
                  style: AppStyles.textStyle18w700.copyWith(
                    color: AppColors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 21.h),
                CustomButton(
                  text: "انتقل للصفحة الرئيسية",
                  onPressed: () {
                    Navigator.pop(context);
                    onConfirm();
                  },
                  color: AppColors.blue,
                  textStyle: AppStyles.textStyle14w700FF.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
