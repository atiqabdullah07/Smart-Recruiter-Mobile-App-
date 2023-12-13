part of 'recruiter_jobs_bloc.dart';

@immutable
sealed class RecruiterJobsEvent {}

class GetJobsEvent extends RecruiterJobsEvent {}
