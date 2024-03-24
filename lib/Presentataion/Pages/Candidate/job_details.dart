import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Data/Models/job.dart';
import 'package:smart_recruiter/Presentataion/Pages/Candidate/file_viewer_page.dart';
import 'package:smart_recruiter/Presentataion/Pages/Candidate/upload_cv.dart';
import 'package:smart_recruiter/Presentataion/Widgets/custom_widgets.dart';

class JobDetails extends StatelessWidget {
  const JobDetails({super.key, required this.job});
  final Job1 job;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.white.withOpacity(0.8),
            child: Center(
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
        backgroundColor: AppColors.backgroundColor.withOpacity(0),
      ),
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
                        image: AssetImage(
                          "assets/Image.jpeg",
                        )),
                    color: AppColors.teal.withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                  ),
                ),
                Positioned(
                    top: 190,
                    child: Hero(
                      tag: job,
                      child: CircleAvatar(
                        backgroundColor: AppColors.blue,
                        radius: 62,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            job.companyLogo!,
                          ),
                          radius: 60,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 70.h,
            ),
            Center(
              child: Text(
                job.title!,
                style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.black80,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            buildCell(title: "Company Name", data: job.companyName!),
            buildCell(title: "Job Title", data: job.title!),
            buildCell(title: "Experience Level", data: job.experienceLevel!),
            buildCell(title: "Job Type", data: job.jobType!),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FileViewer(
                                pdfFile: job.descriptionFile!,
                              )));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 12.h),
                      height: 70.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 1.2,
                          color: AppColors.supportiveGrey.withOpacity(0.2),
                        ),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 14.w),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/pdficon.png",
                              scale: 2,
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
                            ),
                            SizedBox(
                              width: 100.w,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.black,
                            )
                          ],
                        ),
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
                  print(job.id);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UploadCV(
                            jobID: job.id.toString(),
                          )));
                },
                nextIcon: true,
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
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
