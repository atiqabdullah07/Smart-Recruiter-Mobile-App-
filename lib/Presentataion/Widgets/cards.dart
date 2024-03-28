// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Data/Models/job.dart';

class JobsCard2 extends StatelessWidget {
  const JobsCard2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      height: 85.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 1.2,
          color: AppColors.supportiveGrey.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 14.w),
        child: Row(
          children: [
            Container(
              height: 63.h,
              width: 63.w,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    width: 1.2,
                    color: AppColors.supportiveGrey.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image.asset(
                "assets/google.png",
                scale: 1.2,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Software Engineer",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Google, Full Time",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.black,
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

class JobsCard extends StatelessWidget {
  const JobsCard(
      {super.key,
      required this.jobTitle,
      required this.jobType,
      required this.companyName,
      required this.date,
      required this.job,
      required this.companyLogo,
      required this.applyOnPress});

  final String jobTitle;
  final String jobType;
  final String companyName;
  final String date;
  final Job1 job;
  final String companyLogo;
  final VoidCallback applyOnPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.supportiveGrey.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.circular(30.r),

        gradient: LinearGradient(
          colors: [
            AppColors.blue,
            Color.lerp(AppColors.blue, AppColors.green, 0.3)!,
            Color.lerp(AppColors.blue, AppColors.green, 0.6)!,
            AppColors.green,
          ],
          stops: const [0.0, 0.5, 0.7, 1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        // color: color,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 18.h,
          left: 18.w,
          right: 18.w,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 30.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: AppColors.supportiveGrey.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      jobType.split(',')[0],
                      style: TextStyle(color: AppColors.blue, fontSize: 12),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Container(
                  height: 30.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: AppColors.supportiveGrey.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      jobType.split(',')[1],
                      style: TextStyle(color: AppColors.blue, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 13.h,
            ),
            Row(
              children: [
                Hero(
                  tag: job,
                  child: Container(
                    height: 68.h,
                    width: 63.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(companyLogo)),
                      color: Colors.white,
                      border: Border.all(
                        color: AppColors.supportiveGrey.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 200.w,
                          child: Text(
                            jobTitle,
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 200.w,
                          child: Text(
                            companyName,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/Time.svg",
                        height: 20,
                        color: AppColors.white,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      applyOnPress();
                    },
                    child: Container(
                      height: 40.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          "Apply",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JobsCard1 extends StatelessWidget {
  const JobsCard1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        gradient: LinearGradient(
          colors: [
            AppColors.blue,
            Color.lerp(AppColors.blue, AppColors.green, 0.3)!,
            Color.lerp(AppColors.blue, AppColors.green, 0.6)!,
            AppColors.green,
          ],
          stops: const [0.0, 0.5, 0.7, 1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 18.h,
          left: 18.w,
          right: 18.w,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 30.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      "Full Time",
                      style: TextStyle(color: AppColors.blue, fontSize: 12),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Container(
                  height: 30.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      "Remote",
                      style: TextStyle(color: AppColors.blue, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 13.h,
            ),
            Row(
              children: [
                Container(
                  height: 63.h,
                  width: 63.w,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Image.asset(
                    "assets/google.png",
                    scale: 1.2,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Software Engineer",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Google",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/Time.svg",
                        height: 20,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        "10 min ago",
                        style: TextStyle(fontSize: 14, color: AppColors.white),
                      ),
                    ],
                  ),
                  GestureDetector(
                    child: Container(
                      height: 40.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          "Apply",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecruiterJobsCard extends StatelessWidget {
  const RecruiterJobsCard(
      {super.key,
      required this.jobTitle,
      required this.jobType,
      required this.companyName,
      required this.date,
      required this.onTap,
      required this.companyLogo});

  final String jobTitle;
  final String jobType;
  final String companyName;
  final String date;
  final String companyLogo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      height: 195,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        gradient: LinearGradient(
          colors: [
            AppColors.blue,
            Color.lerp(AppColors.blue, AppColors.green, 0.3)!,
            Color.lerp(AppColors.blue, AppColors.green, 0.6)!,
            AppColors.green,
          ],
          stops: const [0.0, 0.5, 0.7, 1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 18.h,
          left: 18.w,
          right: 18.w,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 30.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      jobType.split(',')[0],
                      style: TextStyle(color: AppColors.blue, fontSize: 12),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Container(
                  height: 30.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      jobType.split(',')[1],
                      style: TextStyle(color: AppColors.blue, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 13.h,
            ),
            Row(
              children: [
                Container(
                  height: 63.h,
                  width: 63.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                      companyLogo,
                      scale: 1.2,
                    )),
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      jobTitle,
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      companyName,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/Time.svg",
                        height: 20,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        date,
                        style: TextStyle(fontSize: 14, color: AppColors.white),
                      ),
                    ],
                  ),
                  GestureDetector(
                    child: Container(
                      height: 40.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: onTap,
                          child: Text(
                            "View Status",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorfullCard extends StatelessWidget {
  const ColorfullCard(
      {super.key,
      required this.color,
      required this.jobTitle,
      required this.jobType,
      required this.companyName,
      required this.date,
      required this.isApplied,
      required this.job,
      required this.companyLogo,
      required this.applyOnPress});

  final Color color;
  final String jobTitle;
  final String jobType;
  final String companyName;
  final String date;
  final bool isApplied;
  final Job1 job;
  final String companyLogo;
  final VoidCallback applyOnPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.supportiveGrey.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.circular(30.r),
        color: color,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 18.h,
          left: 18.w,
          right: 18.w,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 30.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: AppColors.supportiveGrey.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      jobType.split(',')[0],
                      style: TextStyle(color: AppColors.blue, fontSize: 12),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Container(
                  height: 30.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: AppColors.supportiveGrey.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      jobType.split(',')[1],
                      style: TextStyle(color: AppColors.blue, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 13.h,
            ),
            Row(
              children: [
                Hero(
                  tag: job,
                  child: Container(
                    height: 68.h,
                    width: 63.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(companyLogo)),
                      color: Colors.white,
                      border: Border.all(
                        color: AppColors.supportiveGrey.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 200.w,
                          child: Text(
                            jobTitle,
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.black.withOpacity(0.8),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 200.w,
                          child: Text(
                            companyName,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.black.withOpacity(0.8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/Time.svg",
                        height: 20,
                        color: AppColors.black.withOpacity(0.7),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      applyOnPress();
                    },
                    child: Container(
                      height: 40.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: isApplied == false
                            ? AppColors.black.withOpacity(0.9)
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          isApplied == false ? "Apply" : 'Applied',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
