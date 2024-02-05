import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smart_recruiter/Data/Models/candidate.dart';
import 'package:smart_recruiter/Repository/auth_repo.dart';

part 'candidate_login_event.dart';
part 'candidate_login_state.dart';

class CandidateLoginBloc
    extends Bloc<CandidateLoginEvent, CandidateLoginState> {
  CandidateLoginBloc() : super(CandidateLoginInitial()) {
    on<CandidateLoginEvent>((event, emit) {});
    on<CandidateLoginClickEvent>(_candidateLoginClickEvent);
  }

  Future<FutureOr<void>> _candidateLoginClickEvent(
      CandidateLoginClickEvent event, Emitter<CandidateLoginState> emit) async {
    final AuthRepo repo = AuthRepo();

    var isSignIn = await repo.logInCandidate(
        candidate: Candidate(email: event.email, password: event.password),
        context: event.context);

    if (isSignIn == true) {
      emit(CandidateLoginSuccessState());
    }
  }
}
