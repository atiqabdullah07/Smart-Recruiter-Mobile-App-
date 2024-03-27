import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Presentataion/Widgets/custom_widgets.dart';
import 'package:smart_recruiter/Repository/GetX%20Controllers/candidate_controller.dart';

class EditCandidateProfile extends StatefulWidget {
  const EditCandidateProfile({super.key});

  @override
  State<EditCandidateProfile> createState() => _EditCandidateProfileState();
}

class _EditCandidateProfileState extends State<EditCandidateProfile> {
  final CandidateController _candidateController =
      Get.put(CandidateController());

  late TextEditingController nameController;
  late TextEditingController emailController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    String name = _candidateController.name.value;
    String email = _candidateController.email.value;

    nameController = TextEditingController(text: name);

    emailController = TextEditingController(text: email);

    super.initState();
  }

  File? pickedImage;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          pickedImage = File(pickedFile.path);
        });
        log('Image picked: ${pickedFile.path}');
      } else {
        log('No image picked.');
      }
    } catch (e) {
      log('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          title: const Text('Edit Profile'),
          centerTitle: true,
        ),
        body: Obx(() {
          if (_candidateController.name.value == "") {
            return const Center(
              child: CircularProgressIndicator(),
            );
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
                      child: GestureDetector(
                        onTap: () {
                          pickImage();
                        },
                        child:
                            _candidateController.profilePic.value == 'null' &&
                                    pickedImage == null
                                ? Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 60.r,
                                        backgroundColor:
                                            AppColors.teal.withOpacity(0.2),
                                        child: Icon(
                                          Icons.person,
                                          size: 60.r,
                                          color: AppColors.blue,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: CircleAvatar(
                                          backgroundColor: AppColors.black,
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 60.r,
                                        backgroundColor: AppColors.black,
                                        child: pickedImage != null
                                            ? CircleAvatar(
                                                radius: 58.r,
                                                backgroundColor: Colors.white,
                                                backgroundImage:
                                                    FileImage(pickedImage!),
                                              )
                                            : CircleAvatar(
                                                radius: 58.r,
                                                backgroundColor: Colors.white,
                                                backgroundImage: NetworkImage(
                                                  _candidateController
                                                      .profilePic.value,
                                                ),
                                              ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: CircleAvatar(
                                          backgroundColor: AppColors.black,
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name'),
                          Padding(
                            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                            child: TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    color: AppColors.black.withOpacity(0.5)),
                                border: const OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter your Name';
                                }
                                return null;
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                          ),
                          Text('Email'),
                          Padding(
                            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                            child: TextFormField(
                              enabled: false,
                              controller: emailController,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    color: AppColors.black.withOpacity(0.5)),
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          Center(
                            child: Column(
                              children: [
                                CustomButton(
                                  title: 'Save Changes',
                                  onPress: () async {
                                    if (_formKey.currentState!.validate()) {
                                      bool isUpdated =
                                          await _candidateController
                                              .updateCandidate(
                                                  updatedName:
                                                      nameController.text,
                                                  filePath: pickedImage == null
                                                      ? ''
                                                      : pickedImage!.path);

                                      if (isUpdated == true) {
                                        showDialog(
                                          context: context,
                                          builder: (context) => CustomDialogWidget(
                                              title: 'Profile Updated',
                                              message:
                                                  'Your Profile has been Updated Successfully'),
                                        );
                                      }
                                    }
                                  },
                                ),
                              ],
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
        }));
  }
}
