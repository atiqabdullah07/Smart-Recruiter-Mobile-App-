import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Presentataion/Widgets/custom_widgets.dart';
import 'package:smart_recruiter/Repository/recruiter_repo.dart';

class RecruiterProfile extends StatefulWidget {
  const RecruiterProfile({super.key});

  @override
  State<RecruiterProfile> createState() => _RecruiterProfileState();
}

class _RecruiterProfileState extends State<RecruiterProfile> {
  File? pickedImage;

  Future pickImage() async {
    print("Method Called");
    final XFile? tempImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (tempImage != null) {
      setState(() {
        pickedImage = File(tempImage.path);
      });
      log(pickedImage.toString());
    } else {
      // Handle case where image picking was canceled or failed
      print("Image picking canceled or failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text('Recruiter Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            CircleAvatar(
                radius: 60.r,
                backgroundColor: AppColors.blue,
                child: pickedImage == null
                    ? GestureDetector(
                        onTap: () {
                          pickImage();
                        },
                        child: CircleAvatar(
                          radius: 58.r,
                          backgroundColor: Colors.grey.shade100,
                        ),
                      )
                    : Stack(
                        children: [
                          CircleAvatar(
                            radius: 58.r,
                            backgroundImage: FileImage(pickedImage!),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 80.w,
                            child: GestureDetector(
                              onTap: () {
                                pickImage();
                              },
                              child: CircleAvatar(
                                backgroundColor: AppColors.teal,
                                radius: 16.r,
                                child: Icon(
                                  Icons.edit,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
            SizedBox(
              height: 50,
            ),
            CustomButton(
                title: 'Save Changes',
                onPress: () {
                  RecruiterRepo repo = RecruiterRepo();

                  repo.recruiterProfileUpdate(pickedImage!.path);
                })
          ]),
        ),
      ),
    );
  }
}
