part of 'recruiter_signup_bloc.dart';

@immutable
class RecruiterSignupEvent {}

class SignUpClicedEvent extends RecruiterSignupEvent {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  SignUpClicedEvent(
      this.username, this.email, this.password, this.confirmPassword);
}
