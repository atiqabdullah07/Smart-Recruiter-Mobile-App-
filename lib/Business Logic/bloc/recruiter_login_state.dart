part of 'recruiter_login_bloc.dart';

@immutable
sealed class RecruiterLoginState {}

final class RecruiterLoginInitial extends RecruiterLoginState {}

class LoginSuccessState extends RecruiterLoginState {}
