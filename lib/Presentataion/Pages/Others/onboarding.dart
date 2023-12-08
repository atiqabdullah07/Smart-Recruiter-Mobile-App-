import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Presentataion/Pages/Others/Category%20Page/categorey.dart';
import 'package:smart_recruiter/Presentataion/Widgets/custom_widgets.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            "assets/onboardingPic 1.png",
            width: 330.h,
          )),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Find Your",
            style: TextStyle(fontSize: 30.sp),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Dream",
                    style:
                        TextStyle(fontSize: 35.sp, fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    "assets/shape01.png",
                    width: 150,
                  )
                ],
              ),
              Text(
                " job!",
                style: TextStyle(fontSize: 35.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Discover countless job openings and \ndelve into company insights.",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: 14.sp, color: AppColors.supportiveGrey),
          ),
          SizedBox(
            height: 100.h,
          ),
          CustomButton(
            title: "Lets Get Started",
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CategoreyPage()),
              );
            },
          )
        ],
      ),
    );
  }
}
