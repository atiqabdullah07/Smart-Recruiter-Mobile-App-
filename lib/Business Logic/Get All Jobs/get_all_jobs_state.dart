part of 'get_all_jobs_bloc.dart';

@immutable
sealed class GetAllJobsState {}

final class GetAllJobsInitial extends GetAllJobsState {}

class GetAllJobsSuccessState extends GetAllJobsState {
  final List<Job1> allJobs;

  GetAllJobsSuccessState(this.allJobs);
}
