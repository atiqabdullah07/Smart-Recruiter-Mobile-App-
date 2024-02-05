part of 'candidate_login_bloc.dart';

@immutable
abstract class CandidateLoginEvent extends Equatable {
  const CandidateLoginEvent();

  List<Object> get props => [];
}

class CandidateLoginClickEvent extends CandidateLoginEvent {
  final String email;
  final String password;
  final BuildContext context;

  const CandidateLoginClickEvent(this.email, this.password, this.context);
}
