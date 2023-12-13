import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_recruiter/Data/Models/job.dart';

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

String hostName = '192.168.45.131';
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
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
      backgroundColor: AppColors.blue,
      textColor: AppColors.white,
      fontSize: 16.sp);
}

void easyLoading() {
  EasyLoading.show(
    indicator: const CircularProgressIndicator(
      backgroundColor: AppColors.green,
      color: AppColors.teal,
    ),
    maskType: EasyLoadingMaskType.none,

    dismissOnTap: true,
    // Customize elevation
  );
}

void loadingIndicator({required BuildContext context}) {
  showDialog(
      barrierColor: Colors.transparent.withOpacity(0),
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: CircleAvatar(
            backgroundColor: Colors.transparent.withOpacity(0),
            radius: 10,
          ),
        );
      });
}

bool isValidEmail(String email) {
  // Define a regular expression for email validation
  final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  // Test the email against the regular expression
  return emailRegExp.hasMatch(email);
}

Job1 myJob = Job1(
  title: "title",
  descriptionFile: "title",
  jobType: "title",
  experienceLevel: "title",
  owner: "title",
  createdAt: "title",
);
