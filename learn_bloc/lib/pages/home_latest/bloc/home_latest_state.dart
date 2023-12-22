part of 'home_latest_bloc.dart';

class HomeLatestState {
  final String message;

  const HomeLatestState({
    this.message = 'Not login',
  });

  HomeLatestState copyWith({
    String? message,
  }) {
    return HomeLatestState(
      message: message ?? this.message,
    );
  }
}
