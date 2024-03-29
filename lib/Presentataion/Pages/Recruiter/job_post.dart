// ignore_for_file: must_be_immutable

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_recruiter/Business%20Logic/Post%20Job/post_job_bloc.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Presentataion/Widgets/custom_widgets.dart';
import 'package:smart_recruiter/Repository/recruiter_repo.dart';

class JobPost extends StatefulWidget {
  JobPost({super.key});

  @override
  State<JobPost> createState() => _JobPostState();
}

class _JobPostState extends State<JobPost> {
  TextEditingController jobTitleController = TextEditingController();

  TextEditingController experienceController = TextEditingController();

  TextEditingController addSkillController = TextEditingController();
  String jobType = "Full Time";
  String jobLocation = "On Site";
  String? pickedFilePath;
  var Skills = [];
  FilePickerResult? result = null;
  String? _pickedFileName;
  Future<void> _pickFiles() async {
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
      );

      if (result != null) {
        setState(() {
          _pickedFileName = result?.files.single.name;
          pickedFilePath = result?.files.single.path; // Store the file name
        });
        print("Picked files: $_pickedFileName");
        print("Picked files: ${result?.files}");
      } else {
        // User canceled the picker
        print("User canceled file picking");
      }
    } catch (e) {
      print("Error picking files: $e");
    }
  }

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Skills",
                            style:
                                TextStyle(fontSize: 18, color: AppColors.black),
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor:
                                          AppColors.backgroundColor,
                                      surfaceTintColor:
                                          AppColors.backgroundColor,
                                      title: Text('Add Skill'),
                                      content: TextField(
                                        decoration: InputDecoration(
                                            hintText: "Enter skill title"),
                                        controller: addSkillController,
                                      ),
                                      actions: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                            setState(() {
                                              addSkillController.clear();
                                            });
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                                child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  color: AppColors.black),
                                            )),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                            setState(() {
                                              Skills.add(
                                                  addSkillController.text);
                                              addSkillController.clear();
                                            });
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                color: AppColors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                                child: Text(
                                              "Add",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: Icon(Icons.add),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: Skills.length * 61.h,
                        child: ListView.builder(
                            itemCount: Skills.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 10),
                                height: 50.h,
                                decoration: BoxDecoration(
                                  color: AppColors.backgroundColor,
                                  border: Border.all(
                                      width: 0.5,
                                      color: AppColors.supportiveGrey
                                          .withOpacity(0.5)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(child: Text(Skills[index])),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 10.h,
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
                      GestureDetector(
                        onTap: () {
                          _pickFiles();
                        },
                        child: Container(
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
                            _pickedFileName == null
                                ? Icon(
                                    Icons.add,
                                    size: 35,
                                    color: AppColors.supportiveGrey
                                        .withOpacity(0.8),
                                  )
                                : Image.asset(
                                    "assets/pdficon.png",
                                    width: 50,
                                  ),
                            SizedBox(
                              width: 10.w,
                            ),
                            SizedBox(
                              width: 220.w,
                              child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                    text: _pickedFileName == null
                                        ? "Upload Job Description File"
                                        : _pickedFileName!,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: AppColors.supportiveGrey
                                            .withOpacity(0.8)),
                                  )),
                            ),
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Center(
                        child: CustomButton(
                            title: "Post Job",
                            onPress: () async {
                              print(pickedFilePath);
                              RecruiterRepo repo = RecruiterRepo();

                              bool isJobPosted = await repo.uploadJob(
                                  filePath: pickedFilePath!,
                                  title: jobTitleController.text,
                                  experienceLevel: experienceController.text,
                                  jobType: jobType,
                                  jobLocation: jobLocation,
                                  context: context,
                                  skills: Skills);

                              print("Posted Job: $isJobPosted");

                              if (isJobPosted == true) {
                                setState(() {
                                  jobTitleController.clear();
                                  experienceController.clear();
                                  _pickedFileName = null;
                                  Skills = [];
                                });
                              }
                            }),
                      ),
                      SizedBox(
                        height: 100,
                      )
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
