import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Presentataion/Pages/Auth/auth_widgets.dart';
import 'package:smart_recruiter/Presentataion/Pages/Auth/signup.dart';
import 'package:smart_recruiter/Presentataion/Pages/Candidate/bottom_nav.dart';
import 'package:smart_recruiter/Presentataion/Pages/Recruiter/recruiter_dashboard.dart';
import 'package:smart_recruiter/Presentataion/Widgets/custom_textfield.dart';
import 'package:smart_recruiter/Presentataion/Widgets/custom_widgets.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
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
                  "Welcome back!",
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Use your credentials below and \nlogin to your account",
                  style: TextStyle(
                    color: AppColors.supportiveGrey,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40.h,
                ),
                const CustomTextField(
                    hintText: "Enter your Email",
                    svgPath: "assets/icons/sms.svg"),
                SizedBox(
                  height: 10.h,
                ),
                const CustomTextField(
                    hintText: "Enter your Password",
                    svgPath: "assets/icons/Lock.svg"),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forget Password?",
                      style: TextStyle(color: AppColors.teal, fontSize: 14),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                CustomButton(
                  title: "Login to your account",
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RecruiterDashboard()),
                    );
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                googleLogin(title: "Login with google"),
                SizedBox(
                  height: 60.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "New to Smart Recruiter?",
                      style: TextStyle(color: AppColors.black),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()),
                        );
                      },
                      child: const Text(
                        " Sign Up here",
                        style: TextStyle(
                            color: AppColors.teal, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
