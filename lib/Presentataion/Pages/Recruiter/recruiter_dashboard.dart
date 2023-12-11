import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Presentataion/Pages/Candidate/wasy.dart';
import 'package:smart_recruiter/Presentataion/Widgets/cards.dart';

class RecruiterDashboard extends StatelessWidget {
  const RecruiterDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      child: CircleAvatar(
                        radius: 40.r,
                        backgroundColor: AppColors.blue,
                        child: CircleAvatar(
                          radius: 38.r,
                          backgroundColor: Colors.green,
                          backgroundImage: const NetworkImage(
                              "https://abouteball.com/wp-content/uploads/2015/03/photodune-4276142-smiling-portraits-m1.jpg"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hello!",
                          style: TextStyle(
                            color: AppColors.supportiveGrey,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Google",
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Discover Best \nCandidate",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 15,
                ),
                headingRow(
                    title: "My Jobs",
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Name()),
                      );
                    }),
                SizedBox(
                  height: 10.h,
                ),
                const RecruiterJobsCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row headingRow({required String title, required VoidCallback onPress}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18.sp,
              color: AppColors.black,
              fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: onPress,
          child: Text(
            "Show all",
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.supportiveGrey,
            ),
          ),
        ),
      ],
    );
  }
}
