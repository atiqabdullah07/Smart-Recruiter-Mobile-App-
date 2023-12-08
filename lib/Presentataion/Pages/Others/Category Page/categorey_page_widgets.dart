import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';

Widget categoreyCard(
    {required String image,
    required String title,
    required bool isSelected,
    required VoidCallback onPress}) {
  return GestureDetector(
    onTap: onPress,
    child: Container(
      height: 245.h,
      width: 162.w,
      decoration: BoxDecoration(
        color: isSelected == true ? const Color(0xffF9FCF1) : Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
            color: isSelected == true ? AppColors.blue : Colors.white),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15), // Shadow color
            spreadRadius: 0, // Spread radius
            blurRadius: 25, // Blur radius
            offset: const Offset(0, 3), // Offset in x and y directions
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                image,
                height: 120.h,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 18.sp,
                  color: isSelected == true ? AppColors.blue : AppColors.black),
            )
          ],
        ),
      ),
    ),
  );
}
