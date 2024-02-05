// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_recruiter/Business%20Logic/Candidate%20Login/candidate_login_bloc.dart';

import 'package:smart_recruiter/Business%20Logic/Recruiter%20Login/recruiter_login_bloc.dart';

import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Presentataion/Pages/Auth/auth_widgets.dart';
import 'package:smart_recruiter/Presentataion/Pages/Auth/candidate_signup.dart';
import 'package:smart_recruiter/Presentataion/Pages/Candidate/bottom_nav.dart';
import 'package:smart_recruiter/Presentataion/Pages/Recruiter/recruiter_bnb.dart';
import 'package:smart_recruiter/Presentataion/Widgets/custom_textfield.dart';
import 'package:smart_recruiter/Presentataion/Widgets/custom_widgets.dart';

class CandidateLogin extends StatefulWidget {
  CandidateLogin({super.key});

  @override
  State<CandidateLogin> createState() => _CandidateLoginState();
}

class _CandidateLoginState extends State<CandidateLogin> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<CandidateLoginBloc, CandidateLoginState>(
          listener: (context, state) {
            if (state is CandidateLoginSuccessState) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => BNB()));
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
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
                    CustomTextField(
                        obsecureText: false,
                        controller: emailController,
                        hintText: "Enter your Email",
                        svgPath: "assets/icons/sms.svg"),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextField(
                        obsecureText: true,
                        controller: passwordController,
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
                        context.read<CandidateLoginBloc>().add(
                            CandidateLoginClickEvent(emailController.text,
                                passwordController.text, context));
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
                                  builder: (context) => CandidateSignUp()),
                            );
                          },
                          child: const Text(
                            " Sign Up here",
                            style: TextStyle(
                                color: AppColors.teal,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}