import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Repository/auth_repo.dart';
import 'package:smart_recruiter/Repository/recruiter_repo.dart';

class CandidateController extends GetxController {
  RxString profilePic = ''.obs;
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString candidateID = ''.obs;

  final carouselIndex = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    getCandidateProfile();
  }

  void updatePageIndicator(index) {
    carouselIndex.value = index;
  }

  Future<void> getCandidateProfile() async {
    try {
      //  profilePic.value = '';
      var jwtToken = await decodeTokken();

      var headers = {
        'Content-Type': 'application/json',
        'Cookie': 'token=$jwtToken'
      };

      var request = http.Request(
          'GET', Uri.parse('http://$hostName:3000/api/v1/candidate/myprofile'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var res = await response.stream.bytesToString();
        print(res);
        // print(res);
        Map<String, dynamic> responseData = jsonDecode(res);

        profilePic.value = await responseData['candidate']['avatar'].toString();
        name.value = await responseData['candidate']['name'];
        email.value = await responseData['candidate']['email'];
        candidateID.value = await responseData['candidate']['_id'];
        print(profilePic);
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {
      log('GetCustomerProfile Catched Error: $error');
    }
  }

  Future<bool> updateCandidate({
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
            Uri.parse('http://$hostName:3000/api/v1/candidate/updateprofile'));
        request.body = json.encode({"name": updatedName});
        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          print(await response.stream.bytesToString());
          isUpdated = true;
          EasyLoading.dismiss();
          await getCandidateProfile();
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
            Uri.parse('http://$hostName:3000/api/v1/candidate/updateprofile'));
        request.body = json.encode({"avatar": avatar, "name": updatedName});
        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          print(await response.stream.bytesToString());
          isUpdated = true;
          EasyLoading.dismiss();
          await getCandidateProfile();
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
