part of 'home_latest_bloc.dart';

abstract class HomeLatestEvent extends Equatable {
  const HomeLatestEvent();
}

class SubmitEvent extends HomeLatestEvent {
  final String username;
  final String password;
  final Function onClear;

  @override
  List<Object?> get props => [username, password];

  const SubmitEvent({
    required this.username,
    required this.password,
    required this.onClear,
  });
}
