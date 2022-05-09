import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_ui/domain/home/home_service.dart';
import '../../domain/home/model/home.dart';
part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeService _homeService;
  HomeBloc(this._homeService) : super(HomeState.initial()) {
    on<LoadNewReleaseData>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        isError: false,
      ));

      final _result = await _homeService.getNewReleases();
      log(_result.toString());

      emit(
        _result.fold(
          (failure) => state.copyWith(
            isError: true,
            isLoading: false,
          ),
          (success) => state.copyWith(
            isError: false,
            isLoading: false,
            newReleaseList: success.results,
            trendingList: state.trendingList,
            popularList: state.popularList,
            tvDramaList: state.tvDramaList,
          ),
        ),
      );
    });
    on<LoadPopularData>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        isError: false,
      ));

      final _result = await _homeService.getPopularOnNetflix();
      log(_result.toString());

      emit(
        _result.fold(
          (failure) => state.copyWith(
            isError: true,
            isLoading: false,
          ),
          (success) => state.copyWith(
            isError: false,
            isLoading: false,
            newReleaseList: state.newReleaseList,
            trendingList: state.trendingList,
            popularList: success.results,
            tvDramaList: state.tvDramaList,
          ),
        ),
      );
    });
    on<LoadTrendingData>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        isError: false,
      ));

      final _result = await _homeService.getTrending();
      log(_result.toString());

      emit(
        _result.fold(
          (failure) => state.copyWith(
            isError: true,
            isLoading: false,
          ),
          (success) => state.copyWith(
            isError: false,
            isLoading: false,
            newReleaseList: state.newReleaseList,
            trendingList: success.results,
            popularList: state.popularList,
            tvDramaList: state.tvDramaList,
          ),
        ),
      );
    });
    on<LoadTvDramaData>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        isError: false,
      ));

      final _result = await _homeService.getTvDramas();
      log(_result.toString());

      emit(
        _result.fold(
          (failure) => state.copyWith(
            isError: true,
            isLoading: false,
          ),
          (success) => state.copyWith(
            isError: false,
            isLoading: false,
            newReleaseList: state.newReleaseList,
            trendingList: state.trendingList,
            popularList: state.popularList,
            tvDramaList: success.results,
          ),
        ),
      );
    });
  }
}
