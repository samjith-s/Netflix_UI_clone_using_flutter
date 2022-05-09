import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_ui/application/fast_laugh/fastlaugh_bloc.dart';
import 'package:netflix_ui/core/colors/colors.dart';
import 'package:netflix_ui/core/strings.dart';
import 'package:netflix_ui/domain/downloads/model/downloads.dart';
import 'package:video_player/video_player.dart';
import 'widgets/widgets_column.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VideoListItemInheritedWidget(
      {Key? key, required this.widget, required this.movieData})
      : super(key: key, child: widget);

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class ScreenFastLaughsPage extends StatelessWidget {
  const ScreenFastLaughsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      BlocProvider.of<FastlaughBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FastlaughBloc, FastlaughState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.isError) {
              return const Center(
                child: Text('Error while fetching data'),
              );
            } else if (state.videosList.isEmpty) {
              return const Center(
                child: Text('videos not available'),
              );
            } else {
              return PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(state.videosList.length, (index) {
                  return VideoListItemInheritedWidget(
                      widget: VideoListItem(
                        index: index,
                        key: Key(index.toString()),
                      ),
                      movieData: state.videosList[index]);
                }),
              );
            }
          },
        ),
      ),
    );
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final url = videoUrl[index % videoUrl.length];
    return Stack(
      children: [
        FastLaughVideoPlayer(videoUrl: url, onStateChanged: (bool) {}),
        const MuteIconWidget(
          size: 24,
        ),
        ColumnOfIconsWidget(
          image:
              "$kAppentUrl${VideoListItemInheritedWidget.of(context)!.movieData.posterPath}",
        ),
      ],
    );
  }
}

int tap = 0;

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isplaying) onStateChanged;
  const FastLaughVideoPlayer(
      {Key? key, required this.videoUrl, required this.onStateChanged})
      : super(key: key);

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {});
      _videoPlayerController.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        tap++;
        setState(() {
          if (tap % 2 == 1) {
            _videoPlayerController.pause();
          } else {
            _videoPlayerController.play();
          }
        });
      },
      child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: _videoPlayerController.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController),
                )
              : const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}

class MuteIconWidget extends StatelessWidget {
  final double size;
  const MuteIconWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: IconButton(
        padding: const EdgeInsets.only(bottom: 5),
        onPressed: () {},
        icon: Icon(
          Icons.volume_off,
          color: whiteColor,
          size: size,
        ),
      ),
    );
  }
}
