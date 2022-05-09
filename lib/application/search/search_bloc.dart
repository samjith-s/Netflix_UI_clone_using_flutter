import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_ui/domain/core/failures/main_failure.dart';
import 'package:netflix_ui/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_ui/domain/search/search_service.dart';

import '../../domain/downloads/model/downloads.dart';
import '../../domain/search/model/search_resp/search_resp.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final SearchService _searchService;
  SearchBloc(this._downloadsService, this._searchService)
      : super(SearchState.initial()) {
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(
          SearchState(
            searchResultList: [],
            idleList: state.idleList,
            isLoading: false,
            isError: false,
          ),
        );
        return;
      }
      emit(
        const SearchState(
          searchResultList: [],
          idleList: [],
          isLoading: true,
          isError: false,
        ),
      );
      //print('onInitialize is called');
      final result = await _downloadsService.getDownloadsImages();
      emit(
        result.fold(
          (failure) => state.copyWith(
            isLoading: false,
            isError: true,
          ),
          (success) => state.copyWith(
            idleList: success,
            isLoading: false,
            isError: false,
          ),
        ),
      );

      // log(result.toString());
    });
    on<SearchMovie>(
      (event, emit) async {
        emit(const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: true,
            isError: false));
        final _result =
            await _searchService.searchMovies(movieQuery: event.movieQuery);

        log(_result.toString());
        emit(
          _result.fold(
            (failure) => state.copyWith(
              isLoading: false,
              isError: true,
            ),
            (success) => state.copyWith(
              searchResultList: success.results,
              isLoading: false,
              isError: false,
            ),
          ),
        );
      },
    );
  }
}
