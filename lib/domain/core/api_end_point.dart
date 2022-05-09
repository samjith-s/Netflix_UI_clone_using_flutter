import 'package:netflix_ui/infrastructure/api_key.dart';

import '../../core/strings.dart';

class ApiEndPoints {
  static const downloads = "$kBaseUrl/trending/all/day?api_key=$apiKey";
  static const search = "$kBaseUrl/search/movie?api_key=$apiKey";

  static const hotAndNewMovie = '$kBaseUrl/discover/movie?api_key=$apiKey';
  static const hotAndNewTV = '$kBaseUrl/discover/tv?api_key=$apiKey';
  
  static const popularOnNetflix = '$kBaseUrl/movie/popular?api_key=$apiKey';
  static const newReleases = '$kBaseUrl/movie/now_playing?api_key=$apiKey';
  static const tvDramas = '$kBaseUrl/movie/top_rated?api_key=$apiKey';
  static const tvTrending = '$kBaseUrl/trending/all/day?api_key=$apiKey';
}
