import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Constants/helper_methods.dart';
import 'package:smart_recruiter/Data/Models/applicants.dart';
import 'package:smart_recruiter/Data/Models/job.dart';
import 'package:smart_recruiter/Data/Models/recruiter.dart';
import 'package:smart_recruiter/Repository/auth_repo.dart';
import 'package:http/http.dart' as http;
import 'package:smart_recruiter/Repository/candidate_repo.dart';

part 'recruiter_jobs_event.dart';
part 'recruiter_jobs_state.dart';

class RecruiterJobsBloc extends Bloc<RecruiterJobsEvent, RecruiterJobsState> {
  RecruiterJobsBloc() : super(RecruiterJobsInitial()) {
    on<RecruiterJobsEvent>((event, emit) {});

    on<GetJobsEvent>(_getJobsEvent);

    on<GetApplicantsEvent>(_GetApplicantsEvent);
  }

  FutureOr<void> _getJobsEvent(
      GetJobsEvent event, Emitter<RecruiterJobsState> emit) async {
    List<Job1> myJobs = [];
    List<Applicant> applicants = [];

    String profilePic = '';
    String companyName = '';
    try {
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
        profilePic = responseData['recruiter']['avatar'];

        print(responseData);

        for (int i = 0; i < responseData['recruiter']['jobs'].length; i++) {
          print("loop");

          applicants.add(Applicant());

          myJobs.add(
            Job1(
                title: responseData['recruiter']['jobs'][i]['title'],
                descriptionFile: responseData['recruiter']['jobs'][i]
                    ['descriptionFile'],
                jobType: responseData['recruiter']['jobs'][i]['jobType'],
                experienceLevel: responseData['recruiter']['jobs'][i]
                    ['experienceLevel'],
                owner: responseData['recruiter']['jobs'][i]['owner'],
                createdAt: dateConvertor(
                  dateFromApi: responseData['recruiter']['jobs'][i]['createdAt']
                      .toString(),
                )),
          );
        }
        myJobs = myJobs.reversed.toList();

        //print("All of my Jobs: ${myJobs[1].title}");
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {
      print("Get Profile Error: $error");
    }

    emit(GetPostsSuccessState(myJobs, companyName, profilePic));
  }

  FutureOr<void> _GetApplicantsEvent(
      GetApplicantsEvent event, Emitter<RecruiterJobsState> emit) async {
    List<Applicant> applicants = [];

    try {
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

        for (int i = 0; i < responseData['recruiter']['jobs'].length; i++) {
          var resumeScore = responseData['recruiter']['jobs'][i]["applicants"]
              [i]['resumeAnalysisScore'];
          var applicantsLength =
              responseData['recruiter']['jobs'][i]["applicants"].length;

          for (int j = 0; j < applicantsLength; j++) {
            var applicantId = responseData['recruiter']['jobs'][i]["applicants"]
                [j]['applicant'];

            var applicant = await getCandidateById(id: applicantId);

            print('Applicant name: ${applicant.name}');
            applicants.add(
              Applicant(
                  id: applicantId,
                  name: applicant.name,
                  picture: applicant.profilePic,
                  score: resumeScore),
            );
          }
        }
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {
      print("Get Profile Error: $error");
    }
    emit(GetApplicantsSuccessState(applicants));
  }
}
