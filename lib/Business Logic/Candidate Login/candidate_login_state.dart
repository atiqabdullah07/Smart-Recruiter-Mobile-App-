part of 'candidate_login_bloc.dart';

@immutable
sealed class CandidateLoginState {}

final class CandidateLoginInitial extends CandidateLoginState {}

class CandidateLoginSuccessState extends CandidateLoginState {}
