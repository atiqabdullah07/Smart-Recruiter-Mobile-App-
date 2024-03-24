import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:smart_recruiter/Constants/app_constants.dart';

import 'package:smart_recruiter/Repository/auth_repo.dart';

class CandidateRepo {
  Future<void> getAllJobs() async {}

  Future<bool> applyJob(
      {required String filePath, required String jobID}) async {
    bool isApplied = false;
    print('Function Called');
    print("Job ID: $jobID");
    print("FilePath: $filePath");
    try {
      easyLoading();
      var jwtToken = await decodeTokken();

      var headers = {
        'Content-Type': 'application/json',
        'Cookie': 'token=$jwtToken'
      };
      var request = http.Request('POST',
          Uri.parse('http://$hostName:3000/api/v1/candidate/applyjob/$jobID'));
      request.body = json.encode({"resumeFile": filePath});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        isApplied = true;
        print("Job Applied");

        print(await response.stream.bytesToString());
      } else {
        EasyLoading.dismiss();
        print(response.reasonPhrase);
        print("Hello");
      }
    } catch (e) {
      EasyLoading.dismiss();
      print("Apply Job Error: $e");
    }
    return isApplied;
  }

  Future<void> searchJob() async {
    try {
      easyLoading();
      var jwtToken = await decodeTokken();

      var headers = {
        'Content-Type': 'application/json',
        'Cookie': 'token=$jwtToken'
      };
      var request = http.Request(
          'POST', Uri.parse('http://$hostName:3000/api/v1/job/searchjob'));
      request.body = json.encode({"title": "New Job"});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        print(await response.stream.bytesToString());
      } else {
        EasyLoading.dismiss();
        print(response.reasonPhrase);
      }
    } catch (e) {
      EasyLoading.dismiss();
      print("Search Job Error Catched: $e");
    }
  }
}
