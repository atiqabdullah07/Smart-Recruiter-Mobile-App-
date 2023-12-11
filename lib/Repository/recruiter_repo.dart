import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:smart_recruiter/Repository/auth_repo.dart';

class RecruiterRepo {
  Future<void> uploadJob() async {
    try {
      var jwtToken = await decodeTokken();

      var headers = {
        'Content-Type': 'application/json',
        'Cookie': 'token=$jwtToken'
      };

      var request = http.Request(
          'POST', Uri.parse('http://localhost:3000/api/v1/job/post'));
      request.body = json.encode({
        "title": "New Job 4",
        "experienceLevel": "1 year of Experience",
        "jobType": "req.body.jobType"
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {
      log("Upload post catched Error: $error");
    }
  }
}
