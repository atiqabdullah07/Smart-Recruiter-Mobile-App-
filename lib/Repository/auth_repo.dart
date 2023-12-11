import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Data/Models/recruiter.dart';

String currentUserID = '';

class AuthRepo {
  Future<String?> decodeTokken() async {
    const storage = FlutterSecureStorage();
    final jwtToken = await storage.read(key: 'jwtToken');
    return jwtToken;
  }

  // Future<bool> signUpUser({required UserModel user}) async {
  //   bool isUSerCreated = false;
  //   try {
  //     var headers = {
  //       'Content-Type': 'application/json',
  //     };
  //     var request = http.Request(
  //         'POST', Uri.parse('http://localhost:3000/api/v1/register'));
  //     request.body = json.encode({
  //       "email": user.email,
  //       "password": user.password,
  //       "name": user.username,
  //       "avatar": user.profileUrl,
  //       "bio": user.bio
  //     });
  //     request.headers.addAll(headers);

  //     http.StreamedResponse response = await request.send();

  //     if (response.statusCode == 200) {
  //       log(await response.stream.bytesToString());
  //     } else {
  //       log(response.reasonPhrase.toString());
  //       isUSerCreated = true;
  //     }
  //   } catch (error) {
  //     log("Register User Error: $error");
  //   }
  //   return isUSerCreated;
  // }

  Future<bool> signInUser({required Recruiter recruiter}) async {
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
      // Handle error
    }

    return isLoggedIn;
  }
}
