import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart_recruiter/Constants/app_constants.dart';

import 'package:smart_recruiter/Repository/auth_repo.dart';

class CandidateRepo {
  Future<void> getAllJobs() async {}

  Future<void> applyJob({requ}) async {
    try {
      var jwtToken = await decodeTokken();

      var headers = {
        'Content-Type': 'application/json',
        'Cookie': 'token=$jwtToken'
      };
      var request = http.Request(
          'POST',
          Uri.parse(
              'http://$hostName:3000/api/v1/candidate/applyjob/6578c447c8e6bfffef5d922a'));
      request.body = json.encode({
        "resumeFile":
            "https://firebasestorage.googleapis.com/v0/b/final-year-project-e2eca.appspot.com/o/files%2F2023-12-13-19-35-7_Azan.pdf?alt=media&token=868c4ce0-fd47-47b3-8b27-c0d0736e80c9",
        "candidateId": "656cc972c9ce108e50c3efba"
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print("Apply Job Error: $e");
    }
  }

  Future<void> searchJob() async {
    try {
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
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print("Search Job Error Catched: $e");
    }
  }
}
