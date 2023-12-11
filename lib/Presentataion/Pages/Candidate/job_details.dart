import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Presentataion/Pages/Candidate/upload_cv.dart';
import 'package:smart_recruiter/Presentataion/Widgets/custom_widgets.dart';

class JobDetails extends StatelessWidget {
  const JobDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://media.architecturaldigest.com/photos/5df25a57649df00009cd1e39/master/pass/HGA-office-PH_190207_N20.jpg",
                        )),
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                  ),
                ),
                Positioned(
                    top: 190,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/google.png",
                      ),
                      radius: 60,
                      backgroundColor: Colors.white,
                    )),
              ],
            ),
            SizedBox(
              height: 70.h,
            ),
            Center(
              child: Text(
                "App Developer",
                style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.black80,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            buildCell(title: "Company Name", data: "Google"),
            buildCell(
                title: "Job Title", data: "Mobile App Developer, Flutter"),
            buildCell(
                title: "Experience Level", data: "1-2 years of experience"),
            buildCell(title: "Job Type", data: "Full Time, On Site"),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Full Job Description",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.supportiveGrey,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 12.h),
                    height: 70.h,
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
                          Image.asset(
                            "assets/google.png",
                            scale: 1.2,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Job Details.pdf",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: CustomButton(
                title: "Apply Now",
                onPress: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => UploadCV()));
                },
                nextIcon: true,
              ),
            ),
            SizedBox(
              height: 100.h,
            )
          ],
        ),
      ),
    );
  }

  Padding buildCell({required String title, required String data}) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.supportiveGrey,
              ),
            ),
            Text(
              data,
              style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold),
            ),
            Divider(
              thickness: 0.5,
            )
          ]),
    );
  }
}
