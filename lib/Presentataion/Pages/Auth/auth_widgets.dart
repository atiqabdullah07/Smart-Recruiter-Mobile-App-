import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';

Widget googleLogin({required String title}) {
  return Container(
    height: 60.h,
    width: 285,
    decoration: BoxDecoration(
        color: AppColors.teal.withOpacity(0.1),
        borderRadius: BorderRadius.circular(100)),
    child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
        height: 60.h,
        width: 60.w,
        decoration: BoxDecoration(
          color: AppColors.teal.withOpacity(0.1),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Image.asset(
            "assets/google.png",
            height: 35.h,
          ),
        ),
      ),
      SizedBox(
        width: 10.w,
      ),
      Text(
        title,
        style: TextStyle(
          color: AppColors.teal,
          fontSize: 15,
        ),
      ),
    ]),
  );
}
