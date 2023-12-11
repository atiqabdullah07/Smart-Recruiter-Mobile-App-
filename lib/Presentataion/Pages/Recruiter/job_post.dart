import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Presentataion/Widgets/custom_widgets.dart';

class JobPost extends StatelessWidget {
  const JobPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          "New Job",
          style: TextStyle(
            fontSize: 25.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textField(title: "Job Title", hintText: "Enter Job Title"),
            SizedBox(
              height: 20.h,
            ),
            textField(
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
                jobButton(title: "Full Time"),
                SizedBox(
                  width: 15.w,
                ),
                jobButton(title: "Part Time"),
              ],
            ),
            SizedBox(
              height: 15.sp,
            ),
            Row(
              children: [
                jobButton(title: "On Site"),
                SizedBox(
                  width: 15.w,
                ),
                jobButton(title: "Remote"),
                SizedBox(
                  width: 15.w,
                ),
                jobButton(title: "Hybrid"),
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
                      fontSize: 16.sp,
                      color: AppColors.supportiveGrey.withOpacity(0.8)),
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
      ),
    );
  }

  Container jobButton({required String title}) {
    return Container(
      height: 40.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }

  Column textField({required String title, required String hintText}) {
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
