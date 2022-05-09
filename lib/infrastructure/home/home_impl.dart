import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_ui/domain/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_ui/domain/home/home_service.dart';
import 'package:netflix_ui/domain/home/model/home.dart';
import '../../domain/core/api_end_point.dart';

@LazySingleton(as: HomeService)
class HomeImplimentation implements HomeService {
  @override
  Future<Either<MainFailure, Home>> getNewReleases() async {
    try {
      final response = await Dio(BaseOptions()).get(ApiEndPoints.newReleases);

      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = Home.fromJson(response.data);

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, Home>> getPopularOnNetflix() async {
    try {
      final response =
          await Dio(BaseOptions()).get(ApiEndPoints.popularOnNetflix);

      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = Home.fromJson(response.data);

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, Home>> getTrending() async {
    try {
      final response = await Dio(BaseOptions()).get(ApiEndPoints.tvTrending);

      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = Home.fromJson(response.data);

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, Home>> getTvDramas() async {
    try {
      final response = await Dio(BaseOptions()).get(ApiEndPoints.tvDramas);

      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = Home.fromJson(response.data);

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
