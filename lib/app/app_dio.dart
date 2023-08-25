import 'package:dio/dio.dart';

class AppDio {
  late Dio _instance;

  Dio get dio => _instance;

  AppDio() {
    _instance = Dio(BaseOptions(
      baseUrl: "https://api.truyengo.com",
      contentType: 'application/json',
    ));
  }
}
