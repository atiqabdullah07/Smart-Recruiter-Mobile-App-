import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Data/Models/candidate.dart';
import 'package:smart_recruiter/Data/Models/recruiter.dart';

String currentUserID = '';

class AuthRepo {
  static const String userTypeKey = 'userType';
  static const String candidateType = 'candidate';
  static const String recruiterType = 'recruiter';
  final GoogleSignIn googleSignIn = GoogleSignIn();

  static Future<String?> getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userTypeKey);
  }

  static Future<void> logout() async {
    easyLoading();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(userTypeKey);
    EasyLoading.dismiss();
  }

  Future<void> continueWithGoogle(BuildContext context) async {
    try {
      GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account != null) {
        // Successfully signed in, get user details
        String displayName = account.displayName!;
        String email = account.email!;
        String photoUrl = account.photoUrl!;

        // Obtain access token
        GoogleSignInAuthentication googleAuth = await account.authentication;
        String accessToken = googleAuth.accessToken!;

        // Proceed with the authenticated user

        print('..........');
        print('..........');
        print('..........');
        print('Access Token: $accessToken');
        print('..........');
        print('..........');
        print("My Name");
        print(displayName);
      }
    } catch (error) {
      print(error);
      // Handle error
    }
  }

  Future<bool> signUpRecruiter(
      {required Recruiter recruiter, required BuildContext context}) async {
    bool isUSerCreated = false;
    print("API Called");
    easyLoading();
    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      var request = http.Request(
          'POST', Uri.parse('http://$hostName:3000/api/v1/recruiter/register'));
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
        // showSuccess(
        //     title: "Registered Successfully.\nNow login to your Account",
        //     context: context);
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

  Future<bool> logInRecruiter(
      {required Recruiter recruiter, required BuildContext context}) async {
    bool isLoggedIn = false;
    easyLoading();
    try {
      var headers = {
        'Content-Type': 'application/json',
      };

      var request = http.Request(
          'POST', Uri.parse('http://$hostName:3000/api/v1/recruiter/login'));
      request.body = json
          .encode({"email": recruiter.email, "password": recruiter.password});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        var res = await response.stream.bytesToString();

        isLoggedIn = true;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(userTypeKey, 'recruiter');

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
        // toast(message);
        showError(title: message, context: context);
      }
    } catch (error) {
      log("Login  Recruiter Catched Error: $error");
    }

    return isLoggedIn;
  }

  Future<bool> signUpCandidate(
      {required Candidate candidate, required BuildContext context}) async {
    bool isUSerCreated = false;
    print("API Called");
    easyLoading();
    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      var request = http.Request(
          'POST', Uri.parse('http://$hostName:3000/api/v1/candidate/register'));
      request.body = json.encode({
        "email": candidate.email,
        "password": candidate.password,
        "name": candidate.name,
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

  Future<bool> logInCandidate(
      {required Candidate candidate, required BuildContext context}) async {
    bool isLoggedIn = false;
    easyLoading();
    try {
      var headers = {
        'Content-Type': 'application/json',
      };

      var request = http.Request(
          'POST', Uri.parse('http://$hostName:3000/api/v1/candidate/login'));
      request.body = json
          .encode({"email": candidate.email, "password": candidate.password});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        var res = await response.stream.bytesToString();

        isLoggedIn = true;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(userTypeKey, 'candidate');

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
        // toast(message);
        showError(title: message, context: context);
      }
    } catch (error) {
      log("Login  Candidate Catched Error: $error");
    }

    return isLoggedIn;
  }
}

Future<String?> decodeTokken() async {
  const storage = FlutterSecureStorage();
  final jwtToken = await storage.read(key: 'jwtToken');
  return jwtToken;
}
