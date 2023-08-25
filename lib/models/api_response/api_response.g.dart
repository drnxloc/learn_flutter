// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<T> _$ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiResponse<T>(
      success: json['success'] as bool,
      status: json['status'] as int,
      message: json['message'] as String?,
      data: fromJsonT(json['data']),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      errors: json['errors'] as Map<String, dynamic>?,
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$ApiResponseToJson<T>(
  ApiResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'message': instance.message,
      'data': toJsonT(instance.data),
      'pagination': instance.pagination?.toJson(),
      'errors': instance.errors,
      'exception': instance.exception,
    };

_$_Pagination _$$_PaginationFromJson(Map<String, dynamic> json) =>
    _$_Pagination(
      current: json['current'] as int,
      first: json['first'] as int,
      last: json['last'] as int,
      prev: json['prev'] as int?,
      next: json['next'] as int?,
      from: json['from'] as int?,
      to: json['to'] as int?,
      limit: json['limit'] as int,
      count: json['count'] as int,
      total: json['total'] as int,
    );

Map<String, dynamic> _$$_PaginationToJson(_$_Pagination instance) =>
    <String, dynamic>{
      'current': instance.current,
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
      'from': instance.from,
      'to': instance.to,
      'limit': instance.limit,
      'count': instance.count,
      'total': instance.total,
    };
