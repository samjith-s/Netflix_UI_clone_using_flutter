import 'package:dartz/dartz.dart';
import 'package:netflix_ui/domain/core/failures/main_failure.dart';
import 'package:netflix_ui/domain/search/model/search_resp/search_resp.dart';

abstract class SearchService {
  Future<Either<MainFailure, SearchResp>> searchMovies({
    required String movieQuery,
  });
}
