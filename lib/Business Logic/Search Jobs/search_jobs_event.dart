part of 'search_jobs_bloc.dart';

@immutable
sealed class SearchJobsEvent {}

class JobSearchedEvent extends SearchJobsEvent {
  final String jobTitle;
  JobSearchedEvent(this.jobTitle);
}

class EmptyJobField extends SearchJobsEvent {}
