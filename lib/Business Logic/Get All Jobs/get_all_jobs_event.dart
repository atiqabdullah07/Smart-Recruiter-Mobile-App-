part of 'get_all_jobs_bloc.dart';

@immutable
sealed class GetAllJobsEvent {}

class GetJobsClickedEvent extends GetAllJobsEvent {}
