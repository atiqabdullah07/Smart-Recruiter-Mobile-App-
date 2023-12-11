part of 'post_job_bloc.dart';

@immutable
sealed class PostJobEvent {}

class JobTypeClickedEvent extends PostJobEvent {
  final String jobType;
  JobTypeClickedEvent(this.jobType);
}
