import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_latest_event.dart';
part 'home_latest_state.dart';

class HomeLatestBloc extends Bloc<HomeLatestEvent, HomeLatestState> {
  HomeLatestBloc() : super(const HomeLatestState()) {
    on<SubmitEvent>(onSubmit);
  }

  void onSubmit(SubmitEvent event, Emitter<HomeLatestState> emit) {
    emit(state.copyWith(message: "Login successfully. Username: ${event.username}. Password: ${event.password}"));
    event.onClear();
  }
}
