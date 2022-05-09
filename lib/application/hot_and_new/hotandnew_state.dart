part of 'hotandnew_bloc.dart';

@freezed
class HotandnewState with _$HotandnewState {
  const factory HotandnewState({
    required bool isLoading,
    required bool isError,
    required List<HotAndNewData> comingSoonList,
    required List<HotAndNewData> everyoneIsWatchingList,
  }) = _Initial;

  factory HotandnewState.initial() => const HotandnewState(
      comingSoonList: [],
      everyoneIsWatchingList: [],
      isError: false,
      isLoading: true,
      );
}
