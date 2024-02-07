import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Constants/helper_methods.dart';
import 'package:smart_recruiter/Data/Models/job.dart';
import 'package:smart_recruiter/Repository/auth_repo.dart';

part 'search_jobs_event.dart';
part 'search_jobs_state.dart';

class SearchJobsBloc extends Bloc<SearchJobsEvent, SearchJobsState> {
  SearchJobsBloc() : super(SearchJobsInitial()) {
    on<SearchJobsEvent>((event, emit) {});
    on<JobSearchedEvent>(_jobSearchedEvent);
    on<EmptyJobField>(_emptyJobField);
  }

  Future<FutureOr<void>> _jobSearchedEvent(
      JobSearchedEvent event, Emitter<SearchJobsState> emit) async {
    List<Job1> myJobs = [];

    try {
      print(event.jobTitle);
      var jwtToken = await decodeTokken();

      var headers = {
        'Content-Type': 'application/json',
        'Cookie': 'token=$jwtToken'
      };
      var request = http.Request(
          'POST', Uri.parse('http://$hostName:3000/api/v1/job/searchjob'));
      request.body = json.encode({"title": event.jobTitle});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var res = await response.stream.bytesToString();
        Map<String, dynamic> responseData = jsonDecode(res);
        print(responseData['jobs']);

        for (int i = 0; i < responseData['jobs'].length; i++) {
          myJobs.add(
            Job1(
                title: responseData['jobs'][i]['title'],
                descriptionFile: responseData['jobs'][i]['descriptionFile'],
                jobType: responseData['jobs'][i]['jobType'],
                experienceLevel: responseData['jobs'][i]['experienceLevel'],
                companyLogo: responseData['jobs'][i]['owner']['avatar'],
                companyName: responseData['jobs'][i]['owner']['name'],
                createdAt: dateConvertor(
                  dateFromApi: responseData['jobs'][i]['createdAt'].toString(),
                )),
          );
        }

        print(myJobs);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print("Search Job Error Catched: $e");
    }
    emit(SearchJobsSuccessState(myJobs));
  }

  FutureOr<void> _emptyJobField(
      EmptyJobField event, Emitter<SearchJobsState> emit) {
    emit(SearchJobsLoadingState());
  }
}
