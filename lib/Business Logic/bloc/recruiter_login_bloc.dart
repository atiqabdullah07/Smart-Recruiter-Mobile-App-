import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:smart_recruiter/Data/Models/recruiter.dart';
import 'package:smart_recruiter/Repository/auth_repo.dart';

part 'recruiter_login_event.dart';
part 'recruiter_login_state.dart';

class RecruiterLoginBloc
    extends Bloc<RecruiterLoginEvent, RecruiterLoginState> {
  RecruiterLoginBloc() : super(RecruiterLoginInitial()) {
    on<RecruiterLoginEvent>((event, emit) {});

    on<LoginClickEvent>(_loginClickedEvent);
  }

  FutureOr<void> _loginClickedEvent(
      LoginClickEvent event, Emitter<RecruiterLoginState> emit) async {
    final AuthRepo repo = AuthRepo();

    var isSignIn = await repo.signInUser(
        recruiter: Recruiter(
      email: event.email,
      password: event.password,
    ));

    if (isSignIn == true) {
      emit(LoginSuccessState());
    }
  }
}
