// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_recruiter/Business%20Logic/Post%20Job/post_job_bloc.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Presentataion/Widgets/custom_widgets.dart';

class JobPost extends StatefulWidget {
  JobPost({super.key});

  @override
  State<JobPost> createState() => _JobPostState();
}

class _JobPostState extends State<JobPost> {
  TextEditingController jobTitleController = TextEditingController();

  TextEditingController experienceController = TextEditingController();

  String jobType = "Full Time";
  String jobLocation = "On Site";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          title: Text(
            "New Job",
            style: TextStyle(
              fontSize: 25.sp,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: BlocConsumer<PostJobBloc, PostJobState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textField(
                          controller: jobTitleController,
                          title: "Job Title",
                          hintText: "Enter Job Title"),
                      SizedBox(
                        height: 20.h,
                      ),
                      textField(
                          controller: experienceController,
                          title: "Experience Required",
                          hintText: "Enter Required Exprience"),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        "Job Type",
                        style: TextStyle(fontSize: 18, color: AppColors.black),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          jobButton(
                              title: "Full Time",
                              isSelected: jobType == "Full Time" ? true : false,
                              onPress: () {
                                setState(() {
                                  jobType = "Full Time";
                                });
                              }),
                          SizedBox(
                            width: 15.w,
                          ),
                          jobButton(
                              title: "Part Time",
                              isSelected: jobType == "Part Time" ? true : false,
                              onPress: () {
                                setState(() {
                                  jobType = "Part Time";
                                });
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      Row(
                        children: [
                          jobButton(
                              title: "On Site",
                              isSelected:
                                  jobLocation == "On Site" ? true : false,
                              onPress: () {
                                setState(() {
                                  jobLocation = "On Site";
                                });
                              }),
                          SizedBox(
                            width: 15.w,
                          ),
                          jobButton(
                              title: "Remote",
                              isSelected:
                                  jobLocation == "Remote" ? true : false,
                              onPress: () {
                                setState(() {
                                  jobLocation = "Remote";
                                });
                              }),
                          SizedBox(
                            width: 15.w,
                          ),
                          jobButton(
                              title: "Hybrid",
                              isSelected:
                                  jobLocation == "Hybrid" ? true : false,
                              onPress: () {
                                setState(() {
                                  jobLocation = "Hybrid";
                                });
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        "Job Descripeion",
                        style: TextStyle(fontSize: 18, color: AppColors.black),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        height: 70.h,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                          border: Border.all(
                            width: 1,
                            color: AppColors.supportiveGrey.withOpacity(0.5),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(children: [
                          SizedBox(
                            width: 20.w,
                          ),
                          Icon(
                            Icons.add,
                            size: 35,
                            color: AppColors.supportiveGrey.withOpacity(0.8),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Upload Job Description File",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color:
                                    AppColors.supportiveGrey.withOpacity(0.8)),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Center(
                        child: CustomButton(title: "Post Job", onPress: () {}),
                      ),
                    ],
                  ),
                );
              }),
        ));
  }

  Widget jobButton(
      {required String title,
      required bool isSelected,
      required VoidCallback onPress}) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 40.h,
        width: 100.w,
        decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: isSelected == true
                  ? AppColors.blue
                  : AppColors.supportiveGrey.withOpacity(0.5)),
          color:
              isSelected == true ? AppColors.blue : AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: isSelected == true ? Colors.white : AppColors.black,
                fontSize: 15),
          ),
        ),
      ),
    );
  }

  Column textField(
      {required String title,
      required String hintText,
      required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, color: AppColors.black),
        ),
        SizedBox(
          height: 10.h,
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle:
                TextStyle(color: AppColors.supportiveGrey.withOpacity(0.5)),
            labelStyle: TextStyle(
              color: Colors.grey.withOpacity(0.3),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(
                  color: AppColors.blue // Set the border color when focused
                  ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.3),
              ),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        )
      ],
    );
  }
}
