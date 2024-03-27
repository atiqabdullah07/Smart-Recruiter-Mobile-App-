import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Data/Models/job.dart';

import 'package:smart_recruiter/Repository/auth_repo.dart';

class RecruiterRepo {
  List<Job1> myJobs = [];

  String companyName = '';

  Future<bool> uploadJob(
      {required String title,
      required String experienceLevel,
      required String jobType,
      required String jobLocation,
      required String filePath,
      required List skills,
      required BuildContext context}) async {
    bool isJobPosted = false;
    if (title.isEmpty) {
      showError(title: 'Please Enter a job title', context: context);
    } else if (experienceLevel.isEmpty) {
      showError(title: 'Enter required exprience', context: context);
    } else {
      try {
        print("Upload Job Called");
        easyLoading();
        var jwtToken = await decodeTokken();

        var headers = {
          'Content-Type': 'application/json',
          'Cookie': 'token=$jwtToken'
        };

        String url = await uploadFile(filePath);

        var request = http.Request(
            'POST', Uri.parse('http://$hostName:3000/api/v1/job/post'));
        request.body = json.encode({
          "title": title,
          "experienceLevel": experienceLevel,
          "jobType": "$jobType,$jobLocation",
          "skills": skills,
          "descriptionFile": url
        });
        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200 || response.statusCode == 201) {
          print(await response.stream.bytesToString());
          EasyLoading.dismiss();
          isJobPosted = true;
          showSuccess(title: 'Job Posted Successfully', context: context);
        } else {
          print(response.reasonPhrase);
          EasyLoading.dismiss();
        }
      } catch (error) {
        EasyLoading.dismiss();
        log("Upload post catched Error: $error");
      }
    }
    return isJobPosted;
  }

  Future<void> getRecruiterProfile() async {
    try {
      print("Recruiter Profile Called");

      var jwtToken = await decodeTokken();

      var headers = {
        'Content-Type': 'application/json',
        'Cookie': 'token=$jwtToken'
      };
      var request = http.Request(
          'GET', Uri.parse('http://$hostName:3000/api/v1/recruiter/myprofile'));

      request.headers.addAll(headers);
      print("object");

      http.StreamedResponse response = await request.send();

      print(response);

      if (response.statusCode == 200) {
        var res = await response.stream.bytesToString();
        // print(res);
        Map<String, dynamic> responseData = jsonDecode(res);

        companyName = responseData['recruiter']['name'];

        print(responseData['recruiter']['jobs']);

        for (int i = 0; i < responseData['recruiter']['jobs'].length; i++) {
          print("loop");
          myJobs.add(
            Job1(
              title: responseData['recruiter']['jobs'][i]['title'],
              descriptionFile: responseData['recruiter']['jobs'][i]
                  ['descriptionFile'],
              jobType: responseData['recruiter']['jobs'][i]['jobType'],
              experienceLevel: responseData['recruiter']['jobs'][i]
                  ['experienceLevel'],
              owner: responseData['recruiter']['jobs'][i]['owner'],
              createdAt:
                  responseData['recruiter']['jobs'][i]['createdAt'].toString(),
            ),
          );
        }
        // var myAllJobs = responseData['recruiter']['jobs'][1];
        // print(myAllJobs);

        print("All of my Jobs: ${myJobs[1].title}");
        //print("My jobs$myAllJobs");
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {
      print("Get Profile Error: $error");
    }
  }

  Future<void> recruiterProfileUpdate(String filePath) async {
    try {
      var jwtToken = await decodeTokken();

      var headers = {
        'Content-Type': 'application/json',
        'Cookie': 'token=$jwtToken'
      };
      String avatar = await uploadFile(filePath);
      var request = http.Request('PUT',
          Uri.parse('http://$hostName:3000/api/v1/recruiter/updateprofile'));
      request.body = json.encode({"avatar": avatar});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print("Recruiter Profile Update Error");
    }
  }
}

Future<String> uploadFile(String filePath) async {
  print("API Called");
  String? url = '';
  try {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://$hostName:3000/api/v1/uploadFile'),
    );

    // Add file to the request
    var file = await http.MultipartFile.fromPath('filename', filePath);
    request.files.add(file);

    var response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      Map<String, dynamic> responseData = jsonDecode(res);
      String message = responseData['url'];
      url = message;

      return url;
    } else {
      print('File upload failed. Status code: ${response.statusCode}');
      print(await response.stream.bytesToString());
    }
  } catch (error) {
    print('Error during file upload: $error');
  }
  return url!;
}
