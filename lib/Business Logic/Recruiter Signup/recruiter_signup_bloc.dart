import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:smart_recruiter/Constants/app_constants.dart';
import 'package:smart_recruiter/Data/Models/recruiter.dart';
import 'package:smart_recruiter/Repository/auth_repo.dart';

part 'recruiter_signup_event.dart';
part 'recruiter_signup_state.dart';

class RecruiterSignupBloc
    extends Bloc<RecruiterSignupEvent, RecruiterSignupState> {
  RecruiterSignupBloc() : super(RecruiterSignupInitial()) {
    on<RecruiterSignupEvent>((event, emit) {});
    on<SignUpClicedEvent>(_signUpClickedEvent);
  }

  FutureOr<void> _signUpClickedEvent(
      SignUpClicedEvent event, Emitter<RecruiterSignupState> emit) async {
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
      bool isSignedIn = await repo.signUpRecruiter(
          recruiter: Recruiter(
              name: event.username,
              email: event.email,
              password: event.password),
          context: event.context);

      if (isSignedIn == true) {
        emit(SignUpSuccessState());
      }
    }
  }
}

void main() {
  // Example usage
  String emailToValidate = 'user@example.com';

  if (isValidEmail(emailToValidate)) {
    print('Valid email address');
  } else {
    print('Invalid email address');
  }
}
