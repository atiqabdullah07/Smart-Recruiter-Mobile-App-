import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Constants/helper_methods.dart';
import 'package:smart_recruiter/Data/Models/job.dart';
import 'package:smart_recruiter/Repository/GetX%20Controllers/candidate_controller.dart';
import 'package:smart_recruiter/Repository/auth_repo.dart';

part 'get_all_jobs_event.dart';
part 'get_all_jobs_state.dart';

class GetAllJobsBloc extends Bloc<GetAllJobsEvent, GetAllJobsState> {
  final CandidateController _candidateController =
      Get.put(CandidateController());
  GetAllJobsBloc() : super(GetAllJobsInitial()) {
    on<GetAllJobsEvent>((event, emit) {});
    on<GetJobsClickedEvent>(_getJobsClickedEvent);
  }

  Future<FutureOr<void>> _getJobsClickedEvent(
      GetJobsClickedEvent event, Emitter<GetAllJobsState> emit) async {
    emit(GetAllJobsLoadingState());
    List<Job1> myJobs = [];

    print('object............');

    try {
      var jwtToken = await decodeTokken();

      var headers = {
        'Content-Type': 'application/json',
        'Cookie': 'token=$jwtToken'
      };

      var request = http.Request(
          'GET', Uri.parse('http://$hostName:3000/api/v1/job/getJobs'));
      request.body = '''''';
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var res = await response.stream.bytesToString();
        Map<String, dynamic> responseData = jsonDecode(res);
        //  print(responseData['jobs'][1]['owner']);

        print(
            'inside data ${responseData['jobs'][0]['applicants'][0]["applicant"]}');
        print('Candidate id: ${_candidateController.candidateID.value}');

        for (int i = 0; i < responseData['jobs'].length; i++) {
          var isApplied = false;
          for (int j = 0;
              j < responseData['jobs'][i]['applicants'].length;
              j++) {
            print('loop 2');

            if (responseData['jobs'][i]['applicants'][j]["applicant"] ==
                _candidateController.candidateID.value) {
              print('True');
              isApplied = true;
              break;
            }
          }

          myJobs.add(
            Job1(
              id: responseData['jobs'][i]['_id'],
              isApplied: isApplied,
              title: responseData['jobs'][i]['title'],
              descriptionFile: responseData['jobs'][i]['descriptionFile'],
              jobType: responseData['jobs'][i]['jobType'],
              experienceLevel: responseData['jobs'][i]['experienceLevel'],
              companyLogo: responseData['jobs'][i]['owner']['avatar'],
              companyName: responseData['jobs'][i]['owner']['name'],
              createdAt: dateConvertor(
                dateFromApi: responseData['jobs'][i]['createdAt'].toString(),
              ),
            ),
          );
        }
        myJobs = myJobs.reversed.toList();
        print("My Jobs: ${myJobs[0].isApplied}");
        print("My Jobs: ${myJobs[0].isApplied}");

        // print(myJobs);
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {
      print("Get all Posts Error: $error");
    }

    emit(GetAllJobsSuccessState(myJobs));
  }
}
