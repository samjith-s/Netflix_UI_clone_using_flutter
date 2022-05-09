import 'package:dartz/dartz.dart';
import '../core/failures/main_failure.dart';
import 'model/home.dart';

abstract class HomeService {
  Future<Either<MainFailure, Home>> getPopularOnNetflix();
  Future<Either<MainFailure, Home>> getTrending();
  Future<Either<MainFailure, Home>> getNewReleases();
  Future<Either<MainFailure, Home>> getTvDramas();
}
