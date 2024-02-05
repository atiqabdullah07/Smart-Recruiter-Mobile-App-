part of 'candidate_sign_up_bloc.dart';

@immutable
sealed class CandidateSignUpState {}

final class CandidateSignUpInitial extends CandidateSignUpState {}

class CandidateSignUpSuccessState extends CandidateSignUpState {}
