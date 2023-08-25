// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Story _$$_StoryFromJson(Map<String, dynamic> json) => _$_Story(
      id: json['id'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      hashTag: json['hashTag'] as String,
      description: json['description'] as String?,
      source: json['source'] as String?,
      keyword: json['keyword'] as String?,
      image: json['image'] as String,
      isAuthenticated: json['isAuthenticated'] as bool,
      isContributed: json['isContributed'] as bool,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      authors: (json['authors'] as List<dynamic>)
          .map((e) => Author.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String,
      visibility: json['visibility'] as String,
      status: json['status'] as String,
      viewCount: json['viewCount'] as int,
      likeCount: json['likeCount'] as int,
      readCount: json['readCount'] as int,
      vipChaptersCount: json['vipChaptersCount'] as int,
      chaptersCount: json['chaptersCount'] as int,
      averageRating: json['averageRating'] as int,
      followersCount: json['followersCount'] as int,
      reviewsCount: json['reviewsCount'] as int,
      navigation: json['navigation'] == null
          ? null
          : Navigation.fromJson(json['navigation'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_StoryToJson(_$_Story instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'hashTag': instance.hashTag,
      'description': instance.description,
      'source': instance.source,
      'keyword': instance.keyword,
      'image': instance.image,
      'isAuthenticated': instance.isAuthenticated,
      'isContributed': instance.isContributed,
      'categories': instance.categories,
      'authors': instance.authors,
      'type': instance.type,
      'visibility': instance.visibility,
      'status': instance.status,
      'viewCount': instance.viewCount,
      'likeCount': instance.likeCount,
      'readCount': instance.readCount,
      'vipChaptersCount': instance.vipChaptersCount,
      'chaptersCount': instance.chaptersCount,
      'averageRating': instance.averageRating,
      'followersCount': instance.followersCount,
      'reviewsCount': instance.reviewsCount,
      'navigation': instance.navigation,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$_Navigation _$$_NavigationFromJson(Map<String, dynamic> json) =>
    _$_Navigation(
      first: json['first'] == null
          ? null
          : ChapterNavigation.fromJson(json['first'] as Map<String, dynamic>),
      last: json['last'] == null
          ? null
          : ChapterNavigation.fromJson(json['last'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_NavigationToJson(_$_Navigation instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
    };

_$_ChapterNavigation _$$_ChapterNavigationFromJson(Map<String, dynamic> json) =>
    _$_ChapterNavigation(
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_ChapterNavigationToJson(
        _$_ChapterNavigation instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
