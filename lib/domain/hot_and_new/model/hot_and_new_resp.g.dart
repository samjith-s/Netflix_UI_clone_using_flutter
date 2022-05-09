// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_and_new_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotAndNewResp _$HotAndNewRespFromJson(Map<String, dynamic> json) =>
    HotAndNewResp(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => HotAndNewData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );

Map<String, dynamic> _$HotAndNewRespToJson(HotAndNewResp instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

HotAndNewData _$HotAndNewDataFromJson(Map<String, dynamic> json) =>
    HotAndNewData(
      backdropPath: json['backdrop_path'] as String?,
      id: json['id'] as int?,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['original_name'] as String?,
    );

Map<String, dynamic> _$HotAndNewDataToJson(HotAndNewData instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'original_name': instance.title,
    };
