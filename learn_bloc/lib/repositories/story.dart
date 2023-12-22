import 'package:dio/dio.dart';
import 'package:learn_flutter/models/api_response/api_response.dart';
import 'package:learn_flutter/models/models.dart';

abstract class IStoryRepository {
  Future<List<Story>> getStories();
}

class StoryRepository implements IStoryRepository {
  final Dio dio;

  const StoryRepository({required this.dio});

  @override
  Future<List<Story>> getStories() async {
    final response = await dio.get("/stories");
    final result = ApiResponse.fromJson(
      response.data,
      ApiResponse.fromListJson(Story.fromJson),
    );
    return result.data;
  }
}

class StoryRepositoryOffline implements IStoryRepository {
  final Dio dio;

  const StoryRepositoryOffline({required this.dio});

  @override
  Future<List<Story>> getStories() async {
    return [];
  }
}
