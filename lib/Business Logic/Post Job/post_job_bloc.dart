import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_job_event.dart';
part 'post_job_state.dart';

class PostJobBloc extends Bloc<PostJobEvent, PostJobState> {
  PostJobBloc() : super(PostJobInitial()) {
    on<PostJobEvent>((event, emit) {
      emit(JobTypeSelected("Full Time"));
    });
    on<JobTypeClickedEvent>(_jobTypeClickedEvent);
  }

  FutureOr<void> _jobTypeClickedEvent(
      JobTypeClickedEvent event, Emitter<PostJobState> emit) {
    print(event.jobType);
    emit(JobTypeSelected(event.jobType));
  }
}
