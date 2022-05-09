import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_ui/domain/hot_and_new/hot_and_new_service.dart';
import '../../domain/hot_and_new/model/hot_and_new_resp.dart';
part 'hotandnew_event.dart';
part 'hotandnew_state.dart';
part 'hotandnew_bloc.freezed.dart';

@injectable
class HotandnewBloc extends Bloc<HotandnewEvent, HotandnewState> {
  final HotAndNewService _hotAndNewService;
  HotandnewBloc(this._hotAndNewService) : super(HotandnewState.initial()) {
    on<LoadDataInComingSoon>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        isError: false,
      ));

      final _result = await _hotAndNewService.getHotAndNewMovieData();
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
            comingSoonList: success.results,
            everyoneIsWatchingList: state.everyoneIsWatchingList,
          ),
        ),
      );
    });

    on<LoadDataInEveryoneIsWatching>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        isError: false,
      ));

      final _result = await _hotAndNewService.getHotAndNewTVData();
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
            comingSoonList: state.comingSoonList,
            everyoneIsWatchingList: success.results,
          ),
        ),
      );
    });
  }
}
