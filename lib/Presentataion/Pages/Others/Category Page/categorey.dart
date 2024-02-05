import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Presentataion/Pages/Auth/candidate_login.dart';
import 'package:smart_recruiter/Presentataion/Pages/Auth/login.dart';
import 'package:smart_recruiter/Presentataion/Pages/Candidate/bottom_nav.dart';
import 'package:smart_recruiter/Presentataion/Pages/Candidate/candidate_dashboard.dart';
import 'package:smart_recruiter/Presentataion/Pages/Others/Category%20Page/categorey_page_widgets.dart';
import 'package:smart_recruiter/Presentataion/Widgets/custom_widgets.dart';

class CategoreyPage extends StatefulWidget {
  const CategoreyPage({super.key});

  @override
  State<CategoreyPage> createState() => _CategoreyPageState();
}

class _CategoreyPageState extends State<CategoreyPage> {
  var isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
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
            "Continue As?",
            style: TextStyle(
                color: AppColors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "Select a Category to begin.",
            style: TextStyle(
              color: AppColors.supportiveGrey,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 60.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              categoreyCard(
                  isSelected: isSelected == 1 ? true : false,
                  image: "assets/illustration01.png",
                  title: "Candidate",
                  onPress: () {
                    setState(() {
                      isSelected = 1;
                    });
                  }),
              SizedBox(
                width: 20.w,
              ),
              categoreyCard(
                  image: "assets/illustration02.png",
                  title: "Recruiter",
                  isSelected: isSelected == 2 ? true : false,
                  onPress: () {
                    setState(() {
                      isSelected = 2;
                    });
                  })
            ],
          ),
          SizedBox(
            height: 100.h,
          ),
          CustomButton(
            title: "Lets Get Started",
            nextIcon: true,
            onPress: () {
              if (isSelected == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CandidateLogin()),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              }
            },
            color: isSelected == 0 ? AppColors.supportiveGrey : AppColors.black,
          )
        ],
      ),
    );
  }
}
