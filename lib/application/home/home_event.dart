part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.loadPopularData() = LoadPopularData;
  const factory HomeEvent.loadTrendingData() = LoadTrendingData;
  const factory HomeEvent.loadNewReleaseData() = LoadNewReleaseData;
  const factory HomeEvent.loadTvDramaData() = LoadTvDramaData;
}
