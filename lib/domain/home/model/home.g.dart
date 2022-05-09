// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Home _$HomeFromJson(Map<String, dynamic> json) => Home(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => HomeData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );

Map<String, dynamic> _$HomeToJson(Home instance) => <String, dynamic>{
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

HomeData _$HomeDataFromJson(Map<String, dynamic> json) => HomeData(
      backdropPath: json['backdrop_path'] as String?,
      posterPath: json['poster_path'] as String?,
      title: json['original_title'] as String?,
    );

Map<String, dynamic> _$HomeDataToJson(HomeData instance) => <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'poster_path': instance.posterPath,
      'original_title': instance.title,
    };
