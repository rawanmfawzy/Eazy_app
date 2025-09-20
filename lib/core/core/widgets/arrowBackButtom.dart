
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../utils/appColor.dart';
import '../utils/appIcons.dart';
import 'customSvg.dart';

class ArrowBackButton extends StatelessWidget {
  final Function()? onPressed;
  const ArrowBackButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 40.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.white2,
      ),
      child: IconButton(
        onPressed: onPressed ??
            () {
              Navigator.pop(context);
            },
        icon: CustomSvg(
          path: AppIcons.arrow_frowerd,
          width: 7.1.w,
          height: 15.84.h,
          color: AppColors.black,
        ),
      ),
    );
  }
}
