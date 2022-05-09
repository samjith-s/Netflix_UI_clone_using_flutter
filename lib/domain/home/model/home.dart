import 'package:json_annotation/json_annotation.dart';
part 'home.g.dart';

@JsonSerializable()
class Home {
  @JsonKey(name: 'results')
  List<HomeData> results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  Home({
    this.results = const [],
    this.totalPages,
    this.totalResults,
  });

  factory Home.fromJson(Map<String, dynamic> json) => _$HomeFromJson(json);

  Map<String, dynamic> toJson() => _$HomeToJson(this);
}

@JsonSerializable()
class HomeData {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'original_title')
  String? title;

  HomeData({
    this.backdropPath,
    this.posterPath,
    this.title,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) {
    return _$HomeDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HomeDataToJson(this);
}
