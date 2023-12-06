import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Defining all the AppColors here
class AppColors {
  static const blue = Color(0xFF0089B5);
  static const green = Color(0xFFC5E474);
  static const teal = Color(0xFF1ABBAC);
  static const black = Color(0xFF01042D);
  static const white = Color(0xFFF7F7F7);
  static const black80 = Color(0xFF343657);
  static const supportiveGrey = Color(0xFF8A8D90);
  static const backgroundColor = Color(0xffffffff);
}

// Defining these spaces so that we don't have to use SizedBox again and again
Widget verticalSpace(double height) {
  return SizedBox(
    height: height.h,
  );
}

Widget horizontalSpace(double width) {
  return SizedBox(
    width: width.w,
  );
}

// Toast
void toast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.blue,
      textColor: AppColors.white,
      fontSize: 16.sp);
}

void easyLoading() {
  EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true);
}
