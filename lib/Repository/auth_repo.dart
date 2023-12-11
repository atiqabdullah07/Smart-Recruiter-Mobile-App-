import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Data/Models/recruiter.dart';

String currentUserID = '';
Future<String?> decodeTokken() async {
  const storage = FlutterSecureStorage();
  final jwtToken = await storage.read(key: 'jwtToken');
  return jwtToken;
}

class AuthRepo {
  Future<bool> signUpRecruiter({required Recruiter recruiter}) async {
    bool isUSerCreated = false;
    print("API Called");
    easyLoading();
    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      var request = http.Request(
          'POST', Uri.parse('http://localhost:3000/api/v1/recruiter/register'));
      request.body = json.encode({
        "email": recruiter.email,
        "password": recruiter.password,
        "name": recruiter.name,
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201) {
        log(await response.stream.bytesToString());
        EasyLoading.dismiss();
        toast("Registered Successfully.\nNow login to your Account");
        isUSerCreated = true;
      } else {
        log(response.reasonPhrase.toString());
        EasyLoading.dismiss();
      }
    } catch (error) {
      log("Register User Error: $error");
    }
    return isUSerCreated;
  }

  Future<bool> logInRecruiter({required Recruiter recruiter}) async {
    bool isLoggedIn = false;
    easyLoading();
    try {
      var headers = {
        'Content-Type': 'application/json',
      };

      var request = http.Request(
          'POST', Uri.parse('http://localhost:3000/api/v1/recruiter/login'));
      request.body = json
          .encode({"email": recruiter.email, "password": recruiter.password});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        var res = await response.stream.bytesToString();

        isLoggedIn = true;

        try {
          // Decode JWT and store it securely
          final jwtToken = jsonDecode(res)["token"];
          const storage = FlutterSecureStorage();
          await storage.write(key: 'jwtToken', value: jwtToken);
        } catch (e) {
          log("Tokken storing Error: $e");
        }
      } else {
        EasyLoading.dismiss();
        var res = await response.stream.bytesToString();
        Map<String, dynamic> responseData = jsonDecode(res);
        String message = responseData['message'];
        toast(message);
      }
    } catch (error) {
      log("Login  Recruiter Catched Error: $error");
    }

    return isLoggedIn;
  }
}
