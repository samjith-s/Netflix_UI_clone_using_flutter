part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool isLoading,
    required bool isError,
    required List<HomeData> newReleaseList,
    required List<HomeData> trendingList,
    required List<HomeData> popularList,
    required List<HomeData> tvDramaList,
  }) = _Initial;

  factory HomeState.initial() => const HomeState(
        isLoading: true,
        isError: false,
        newReleaseList: [],
        trendingList: [],
        popularList: [],
        tvDramaList: [],
      );
}
