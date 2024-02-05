part of 'candidate_sign_up_bloc.dart';

@immutable
sealed class CandidateSignUpEvent {}

class CandidateSignUpClicedEvent extends CandidateSignUpEvent {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;
  final BuildContext context;

  CandidateSignUpClicedEvent(this.username, this.email, this.password,
      this.confirmPassword, this.context);
}
