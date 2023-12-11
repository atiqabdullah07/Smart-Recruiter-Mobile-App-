part of 'recruiter_signup_bloc.dart';

@immutable
sealed class RecruiterSignupState {}

final class RecruiterSignupInitial extends RecruiterSignupState {}

class SignUpSuccessState extends RecruiterSignupState {}
