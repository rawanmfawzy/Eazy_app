
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/appColor.dart';
import '../utils/appStyles.dart';
import 'arrowBackButtom.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final Function()? onPressed;
  const CustomAppBar({super.key, this.title, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 62.h),
      child: Row(
        children: [
          SizedBox(
            width: 110.w,
          ),
          Text(
            title ?? "",
            style: AppStyles.textStyle18w400.copyWith(color: AppColors.black),
          ),
          const Spacer(),
          ArrowBackButton(
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}
