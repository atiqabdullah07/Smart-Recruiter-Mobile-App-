import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Presentataion/Widgets/cards.dart';

class CandidateDashboard extends StatelessWidget {
  const CandidateDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 40.r,
                    backgroundColor: AppColors.blue,
                    child: CircleAvatar(
                      radius: 38.r,
                      backgroundColor: Colors.green,
                      backgroundImage: const NetworkImage(
                          "https://abouteball.com/wp-content/uploads/2015/03/photodune-4276142-smiling-portraits-m1.jpg"),
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
                          fontSize: 20.sp,
                        ),
                      ),
                      Text(
                        "Alexa Jhons",
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 20.sp,
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
                "Discover Your \nFavourite Job",
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15), // Shadow color
                        spreadRadius: 0, // Spread radius
                        blurRadius: 20, // Blur radius
                        offset:
                            const Offset(0, 0), // Offset in x and y directions
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: AppColors.supportiveGrey
                                        .withOpacity(0.5),
                                    fontSize: 16.sp),
                                hintText: "Search your dream job..."),
                          ),
                        ),
                      ),
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(200),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/icons/Search.svg",
                            height: 22.h,
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 15.sp,
              ),
              headingRow(title: "Popular jobs", onPress: () {}),
              SizedBox(
                height: 10.h,
              ),
              const JobsCard1(),
              SizedBox(
                height: 20.h,
              ),
              headingRow(title: "All jobs", onPress: () {}),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 200.h,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const JobsCard2();
                    }),
              ),
              SizedBox(
                height: 100.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  Row headingRow({required String title, required VoidCallback onPress}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 20.sp,
              color: AppColors.black,
              fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: onPress,
          child: Text(
            "Show all",
            style: TextStyle(
              fontSize: 18.sp,
              color: AppColors.supportiveGrey,
            ),
          ),
        ),
      ],
    );
  }
}
