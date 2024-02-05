import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Data/Models/candidate.dart';

import 'package:smart_recruiter/Repository/auth_repo.dart';

part 'candidate_sign_up_event.dart';
part 'candidate_sign_up_state.dart';

class CandidateSignUpBloc
    extends Bloc<CandidateSignUpEvent, CandidateSignUpState> {
  CandidateSignUpBloc() : super(CandidateSignUpInitial()) {
    on<CandidateSignUpEvent>((event, emit) {});

    on<CandidateSignUpClicedEvent>(_candidateSignUpClicedEvent);
  }

  Future<FutureOr<void>> _candidateSignUpClicedEvent(
      CandidateSignUpClicedEvent event,
      Emitter<CandidateSignUpState> emit) async {
    AuthRepo repo = AuthRepo();
    if (event.password != event.confirmPassword) {
      showError(title: "Confirm Password not Matched.", context: event.context);
    } else if (event.email == '' ||
        event.username == '' ||
        event.password == '') {
      showError(title: "Please Enter all information.", context: event.context);
    } else if (isValidEmail(event.email) == false) {
      showError(title: "Enter a valid Email.", context: event.context);
    } else if (event.password.length < 6) {
      showError(
          title: "Please Enter atlest 6 digit password.",
          context: event.context);
    } else {
      bool isSignedIn = await repo.signUpCandidate(
          candidate: Candidate(
              name: event.username,
              email: event.email,
              password: event.password),
          context: event.context);

      if (isSignedIn == true) {
        emit(CandidateSignUpSuccessState());
      }
    }
  }
}
