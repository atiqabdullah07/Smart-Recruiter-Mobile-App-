import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Presentataion/Pages/Auth/auth_widgets.dart';

import 'package:smart_recruiter/Presentataion/Widgets/custom_textfield.dart';
import 'package:smart_recruiter/Presentataion/Widgets/custom_widgets.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              "assets/logo.png",
              width: 85.h,
            )),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Welcome",
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Create your new Account.",
              style: TextStyle(
                color: AppColors.supportiveGrey,
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40.h,
            ),
            const CustomTextField(
                hintText: "Enter your Full Name",
                svgPath: "assets/icons/user.svg"),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
                hintText: "Enter your Email", svgPath: "assets/icons/sms.svg"),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
                hintText: "Enter your Password",
                svgPath: "assets/icons/Lock.svg"),
            SizedBox(
              height: 10.h,
            ),
            const CustomTextField(
                hintText: "Confirm Password", svgPath: "assets/icons/Lock.svg"),
            SizedBox(
              height: 50.h,
            ),
            CustomButton(
              title: "Create Account",
              onPress: () {},
            ),
            SizedBox(
              height: 20.h,
            ),
            googleLogin(title: "SignUp with google"),
            SizedBox(
              height: 60.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an Account?",
                  style: TextStyle(color: AppColors.black),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    " Login",
                    style: TextStyle(
                        color: AppColors.teal, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
