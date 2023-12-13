import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Data/Models/job.dart';
import 'package:smart_recruiter/Repository/auth_repo.dart';
import 'package:http/http.dart' as http;

part 'recruiter_jobs_event.dart';
part 'recruiter_jobs_state.dart';

class RecruiterJobsBloc extends Bloc<RecruiterJobsEvent, RecruiterJobsState> {
  RecruiterJobsBloc() : super(RecruiterJobsInitial()) {
    on<RecruiterJobsEvent>((event, emit) {});

    on<GetJobsEvent>(_getJobsEvent);
  }

  FutureOr<void> _getJobsEvent(
      GetJobsEvent event, Emitter<RecruiterJobsState> emit) async {
    List<Job1> myJobs = [];
    String profilePic = '';
    String companyName = '';
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
      print(" Hello");

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var res = await response.stream.bytesToString();
        // print(res);
        Map<String, dynamic> responseData = jsonDecode(res);

        companyName = responseData['recruiter']['name'];

        print(responseData);

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

        print("All of my Jobs: ${myJobs[1].title}");
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {
      print("Get Profile Error: $error");
    }

    emit(GetPostsSuccessState(myJobs, companyName, profilePic));
  }
}
