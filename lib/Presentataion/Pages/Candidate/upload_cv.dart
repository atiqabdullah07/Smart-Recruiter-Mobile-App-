import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';

class UploadCV extends StatelessWidget {
  const UploadCV({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text("Upload CV"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Please Update your Resume",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Container(
              height: 250.h,
              width: 200.w,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 0.8,
                      color: AppColors.supportiveGrey.withOpacity(0.5)),
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(30.r)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/cv.png",
                      height: 100,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Upload Resume",
                      style: TextStyle(
                          fontSize: 18, color: AppColors.supportiveGrey),
                    )
                  ]),
            ),
          )
        ]),
      ),
    );
  }
}
