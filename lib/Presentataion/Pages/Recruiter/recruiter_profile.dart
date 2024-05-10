// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';

import 'package:smart_recruiter/Presentataion/Pages/Recruiter/edit_recruiter_profile.dart';

import 'package:smart_recruiter/Repository/GetX%20Controllers/recruiter_controller.dart';

class RecruiterProfile extends StatefulWidget {
  const RecruiterProfile({super.key});

  @override
  State<RecruiterProfile> createState() => _RecruiterProfileState();
}

class _RecruiterProfileState extends State<RecruiterProfile> {
  final RecruiterController _candidateController =
      Get.put(RecruiterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.backgroundColor,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditRecruiterProfile()));
              },
              child: const Text(
                'Edit Profile',
                style: TextStyle(color: AppColors.black),
              ),
            )
          ],
          title: Text('Profile'),
          centerTitle: true,
        ),
        body: Obx(() {
          if (_candidateController.name == '') {
            return Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: _candidateController.profilePic == 'null'
                          ? CircleAvatar(
                              radius: 50.r,
                              backgroundColor: AppColors.teal.withOpacity(0.2),
                              child: Icon(
                                Icons.person,
                                size: 50.r,
                                color: AppColors.blue,
                              ),
                            )
                          : CircleAvatar(
                              radius: 50.r,
                              backgroundColor: AppColors.black,
                              child: CircleAvatar(
                                radius: 48.r,
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage(
                                    _candidateController.profilePic.toString()),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      _candidateController.name.value,
                      style: TextStyle(color: AppColors.black, fontSize: 25),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(_candidateController.email.value),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            );
          }
        }));
  }
}
