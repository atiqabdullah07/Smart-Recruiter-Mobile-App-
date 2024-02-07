import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Presentataion/Widgets/custom_widgets.dart';

class UploadCV extends StatefulWidget {
  const UploadCV({super.key});

  @override
  State<UploadCV> createState() => _UploadCVState();
}

class _UploadCVState extends State<UploadCV> {
  FilePickerResult? result = null;
  String? _pickedFileName;
  String? pickedFilePath;
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
        title: const Text("Upload CV"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Please Update your Resume",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                _pickFiles();
              },
              child: Container(
                height: 250.h,
                width: 200.w,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 0.8,
                        color: AppColors.supportiveGrey.withOpacity(0.5)),
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(30.r)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _pickedFileName == null
                          ? Image.asset(
                              "assets/cv.png",
                              height: 100,
                            )
                          : Image.asset('assets/pdficon.png'),
                      SizedBox(
                        height: 20.h,
                      ),
                      _pickedFileName == null
                          ? Text(
                              "Upload Resume",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.supportiveGrey),
                            )
                          : SizedBox(
                              width: 150,
                              child: RichText(
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: _pickedFileName.toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: AppColors.supportiveGrey),
                                ),
                              ),
                            )
                    ]),
              ),
            ),
          ),
          SizedBox(
            height: 300,
          ),
          Center(child: CustomButton(title: "Apply Now", onPress: () {}))
        ]),
      ),
    );
  }
}
