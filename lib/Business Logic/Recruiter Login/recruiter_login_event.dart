part of 'recruiter_login_bloc.dart';

@immutable
abstract class RecruiterLoginEvent extends Equatable {
  const RecruiterLoginEvent();

  List<Object> get props => [];
}

class LoginClickEvent extends RecruiterLoginEvent {
  final String email;
  final String password;

  const LoginClickEvent(
    this.email,
    this.password,
  );
}
