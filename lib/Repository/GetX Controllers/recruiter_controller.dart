import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:smart_recruiter/Repository/auth_repo.dart';
import 'dart:convert';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Repository/recruiter_repo.dart';

class RecruiterController extends GetxController {
  RxString profilePic = ''.obs;
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString recruiterID = ''.obs;

  Future<void> getRecruiterProfile() async {
    try {
      //  profilePic.value = '';
      var jwtToken = await decodeTokken();

      var headers = {
        'Content-Type': 'application/json',
        'Cookie': 'token=$jwtToken'
      };

      var request = http.Request(
          'GET', Uri.parse('http://$hostName:3000/api/v1/recruiter/myprofile'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var res = await response.stream.bytesToString();
        print(res);
        // print(res);
        Map<String, dynamic> responseData = jsonDecode(res);

        profilePic.value = await responseData['recruiter']['avatar'].toString();
        name.value = await responseData['recruiter']['name'];
        email.value = await responseData['recruiter']['email'];
        recruiterID.value = await responseData['recruiter']['_id'];
        print(profilePic);
        print(name);
        print(email);
        print(recruiterID);
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {
      log('getRecruiterProfile Catched Error: $error');
    }
  }

  Future<bool> updateRecruiter({
    required String updatedName,
    required String filePath,
  }) async {
    bool isUpdated = false;

    try {
      easyLoading();
      var jwtToken = await decodeTokken();
      if (filePath == '') {
        var headers = {
          'Content-Type': 'application/json',
          'Cookie': 'token=$jwtToken'
        };

        var request = http.Request('PUT',
            Uri.parse('http://$hostName:3000/api/v1/recruiter/updateprofile'));
        request.body = json.encode({"name": updatedName});
        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          print(await response.stream.bytesToString());
          isUpdated = true;
          EasyLoading.dismiss();
          await getRecruiterProfile();
        } else {
          EasyLoading.dismiss();
          print(response.reasonPhrase);
        }
      } else {
        String avatar = await uploadFile(filePath);
        var headers = {
          'Content-Type': 'application/json',
          'Cookie': 'token=$jwtToken'
        };

        var request = await http.Request('PUT',
            Uri.parse('http://$hostName:3000/api/v1/recruiter/updateprofile'));
        request.body = json.encode({"avatar": avatar, "name": updatedName});
        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          print(await response.stream.bytesToString());
          isUpdated = true;
          EasyLoading.dismiss();
          await getRecruiterProfile();
        } else {
          print(response.reasonPhrase);
          EasyLoading.dismiss();
        }
      }
    } catch (error) {
      EasyLoading.dismiss();
      log('updateCandidate Catched Error: $error');
    }
    return isUpdated;
  }
}
