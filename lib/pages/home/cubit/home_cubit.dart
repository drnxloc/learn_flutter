import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learn_flutter/models/models.dart';
import 'package:learn_flutter/repositories/repositories.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final IStoryRepository storyRepository;
  HomeCubit({
    required this.storyRepository,
  }) : super(const HomeState());

  void getStories() async {
    final stories = await storyRepository.getStories();
    emit(state.copyWith(stories: stories));
  }
}
