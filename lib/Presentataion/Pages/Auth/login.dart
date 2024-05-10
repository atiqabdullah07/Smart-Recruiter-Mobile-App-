// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smart_recruiter/Business%20Logic/Recruiter%20Login/recruiter_login_bloc.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Presentataion/Pages/Auth/auth_widgets.dart';
import 'package:smart_recruiter/Presentataion/Pages/Auth/signup.dart';
import 'package:smart_recruiter/Presentataion/Pages/Recruiter/recruiter_home.dart';
import 'package:smart_recruiter/Presentataion/Widgets/custom_textfield.dart';
import 'package:smart_recruiter/Presentataion/Widgets/custom_widgets.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<RecruiterLoginBloc, RecruiterLoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => RecruiterHome()));
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
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40.h,
                          ),
                          CustomTextField(
                            obsecureText: false,
                            controller: emailController,
                            hintText: "Enter your Email",
                            svgPath: "assets/icons/sms.svg",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Email';
                              }

                              String emailRegex =
                                  r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
                              RegExp regex = RegExp(emailRegex);

                              if (!regex.hasMatch(value)) {
                                return 'Please Enter a Valid Email';
                              }

                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CustomTextField(
                            obsecureText: true,
                            controller: passwordController,
                            hintText: "Enter your Password",
                            svgPath: "assets/icons/Lock.svg",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter a password';
                              }

                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
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
                        if (_formKey.currentState!.validate()) {
                          context.read<RecruiterLoginBloc>().add(
                                LoginClickEvent(emailController.text,
                                    passwordController.text, context),
                              );
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // googleLogin(title: "Login with google", onTap: () {}),
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
                              MaterialPageRoute(builder: (context) => SignUp()),
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
