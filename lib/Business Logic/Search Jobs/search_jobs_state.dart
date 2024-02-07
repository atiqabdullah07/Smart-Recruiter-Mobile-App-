part of 'search_jobs_bloc.dart';

@immutable
sealed class SearchJobsState {}

final class SearchJobsInitial extends SearchJobsState {}

class SearchJobsSuccessState extends SearchJobsState {
  final List<Job1> allJobs;

  SearchJobsSuccessState(this.allJobs);
}

class SearchJobsLoadingState extends SearchJobsState {}
