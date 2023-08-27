part of 'home_cubit.dart';

// @freezed
// class HomeState with _$HomeState {
//   const factory HomeState({
//     @Default([]) List<Story> stories,
//   }) = _HomeState;
// }

class HomeState {
  final List<Story> stories;
  final String title;

  const HomeState({
    this.stories = const [],
    this.title = '',
  });

  HomeState copyWith({
    List<Story>? stories,
    String? title,
  }) {
    return HomeState(
      stories: stories ?? this.stories,
      title: title ?? this.title,
    );
  }
}
