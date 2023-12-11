part of 'post_job_bloc.dart';

@immutable
sealed class PostJobState {}

final class PostJobInitial extends PostJobState {}

class JobTypeSelected extends PostJobState {
  final String jobType;

  JobTypeSelected(this.jobType);
}
