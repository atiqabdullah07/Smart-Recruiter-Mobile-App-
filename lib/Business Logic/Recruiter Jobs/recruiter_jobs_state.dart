part of 'recruiter_jobs_bloc.dart';

@immutable
sealed class RecruiterJobsState {}

final class RecruiterJobsInitial extends RecruiterJobsState {}

class GetPostsSuccessState extends RecruiterJobsState {
  final List<Job1> myJobs;
  final String name;
  final String companyLogo;

  GetPostsSuccessState(this.myJobs, this.name, this.companyLogo);
}

class GetApplicantsSuccessState extends RecruiterJobsState {
  final List<Applicant> applicants;

  GetApplicantsSuccessState(this.applicants);
}
