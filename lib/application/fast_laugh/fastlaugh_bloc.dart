import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_ui/application/search/search_bloc.dart';
import 'package:netflix_ui/domain/downloads/i_downloads_repo.dart';

import '../../domain/downloads/model/downloads.dart';

part 'fastlaugh_event.dart';
part 'fastlaugh_state.dart';
part 'fastlaugh_bloc.freezed.dart';

final videoUrl = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4"
];

@injectable
class FastlaughBloc extends Bloc<FastlaughEvent, FastlaughState> {
  FastlaughBloc(
    IDownloadsRepo _downloadService,
  ) : super(FastlaughState.initial()) {
    on<Initialize>((event, emit) async {
      //sent initial loading to UI
      emit(state.copyWith(
        isLoading: true,
        isError: false,
      ));
      //get trending list
      final _result = await _downloadService.getDownloadsImages();
      //sent trending list to UI
      emit(
        _result.fold(
          (failure) => state.copyWith(
            isLoading: false,
            isError: true,
            videosList: [],
          ),
          (success) => state.copyWith(
            isLoading: false,
            isError: false,
            videosList: success,
          ),
        ),
      );
    });
  }
}
