import 'package:dartz/dartz.dart';
import 'package:netflix_ui/domain/core/failures/main_failure.dart';
import 'package:netflix_ui/domain/hot_and_new/model/hot_and_new_resp.dart';

abstract class HotAndNewService {
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMovieData();
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewTVData();
}
