import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class ApiResponse<T> extends Equatable {
  final bool success;
  final int status;
  final String? message;
  final T data;
  final Pagination? pagination;
  final Map<String, dynamic>? errors;
  final String? exception;

  const ApiResponse({
    required this.success,
    required this.status,
    this.message,
    required this.data,
    this.pagination,
    this.errors,
    this.exception,
  });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic json) fromJsonT) {
    return _$ApiResponseFromJson(json, fromJsonT);
  }

  factory ApiResponse.fromJsonMsg(Map<String, dynamic> json) {
    return _$ApiResponseFromJson(json, (_) => null as T);
  }

  Map<String, dynamic> toJson(Object? Function(T? value) toJsonT) {
    return _$ApiResponseToJson(this, toJsonT);
  }

  @override
  List<Object?> get props =>
      [success, status, message, data, pagination, errors, exception];

  @override
  bool get stringify => true;

  static T? Function(dynamic data) fromNullJson<T>(
      T Function(Map<String, dynamic>) callback) {
    return (data) => data == null ? null : callback(data);
  }

  static List<T> Function(dynamic data) fromListJson<T>(
      T Function(Map<String, dynamic>) callback) {
    return (data) => List<T>.from(data.map((item) => callback(item)));
  }
}

@freezed
class Pagination with _$Pagination {
  const Pagination._();

  const factory Pagination({
    required int current,
    required int first,
    required int last,
    int? prev,
    int? next,
    int? from,
    int? to,
    required int limit,
    required int count,
    required int total,
  }) = _Pagination;

  String get message => "$current/$last";

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}
