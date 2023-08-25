import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learn_flutter/models/models.dart';

part 'story.freezed.dart';
part 'story.g.dart';

@freezed
class Story with _$Story {
  const factory Story({
    required int id,
    required String name,
    required String slug,
    required String hashTag,
    String? description,
    String? source,
    String? keyword,
    required String image,
    required bool isAuthenticated,
    required bool isContributed,
    required List<Category> categories,
    required List<Author> authors,
    required String type,
    required String visibility,
    required String status,
    required int viewCount,
    required int likeCount,
    required int readCount,
    required int vipChaptersCount,
    required int chaptersCount,
    required int averageRating,
    required int followersCount,
    required int reviewsCount,
    Navigation? navigation,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}

@freezed
class Navigation with _$Navigation {
  const factory Navigation({
    ChapterNavigation? first,
    ChapterNavigation? last,
  }) = _Navigation;

  factory Navigation.fromJson(Map<String, dynamic> json) =>
      _$NavigationFromJson(json);
}

@freezed
class ChapterNavigation with _$ChapterNavigation {
  const factory ChapterNavigation({
    required int id,
  }) = _ChapterNavigation;

  factory ChapterNavigation.fromJson(Map<String, dynamic> json) =>
      _$ChapterNavigationFromJson(json);
}
