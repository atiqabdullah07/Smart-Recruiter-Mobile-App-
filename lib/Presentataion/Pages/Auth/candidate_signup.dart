// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_recruiter/Business%20Logic/Candidate%20SignUp/candidate_sign_up_bloc.dart';
import 'package:smart_recruiter/Business%20Logic/Recruiter%20Signup/recruiter_signup_bloc.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Presentataion/Pages/Auth/auth_widgets.dart';
import 'package:smart_recruiter/Presentataion/Pages/Auth/candidate_login.dart';
import 'package:smart_recruiter/Presentataion/Pages/Auth/login.dart';

import 'package:smart_recruiter/Presentataion/Widgets/custom_textfield.dart';
import 'package:smart_recruiter/Presentataion/Widgets/custom_widgets.dart';

class CandidateSignUp extends StatefulWidget {
  CandidateSignUp({super.key});

  @override
  State<CandidateSignUp> createState() => _CandidateSignUpState();
}

class _CandidateSignUpState extends State<CandidateSignUp> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<CandidateSignUpBloc, CandidateSignUpState>(
          listener: (context, state) {
            if (state is CandidateSignUpSuccessState) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => CandidateLogin()));
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
                      "Welcome",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Create your new Account.",
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
                        controller: usernameController,
                        hintText: "Enter your Full Name",
                        svgPath: "assets/icons/user.svg"),
                    SizedBox(
                      height: 10.h,
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
                    CustomTextField(
                        obsecureText: true,
                        controller: confirmPasswordController,
                        hintText: "Confirm Password",
                        svgPath: "assets/icons/Lock.svg"),
                    SizedBox(
                      height: 50.h,
                    ),
                    CustomButton(
                      title: "Create Account",
                      onPress: () {
                        context.read<CandidateSignUpBloc>().add(
                            CandidateSignUpClicedEvent(
                                usernameController.text,
                                emailController.text,
                                passwordController.text,
                                confirmPasswordController.text,
                                context));
                      },
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
