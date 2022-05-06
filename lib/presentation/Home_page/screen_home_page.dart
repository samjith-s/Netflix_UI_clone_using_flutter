import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/presentation/Home_page/widgets/vertical_movie_listview_section.dart';
import 'widgets/homepage_mainimage_widget.dart';
import 'widgets/imagelist_with_number_widget.dart';
import 'widgets/scroll_responsive_appbar_widget.dart';

ValueNotifier<bool> scrollDirectionNotifier = ValueNotifier(true);

class ScreenHomePage extends StatelessWidget {
  const ScreenHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollDirectionNotifier,
        builder: (BuildContext _context, bool scrollDirection, Widget? _) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 4,
              left: 6,
            ),
            child: NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                if (direction == ScrollDirection.reverse) {
                  scrollDirectionNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollDirectionNotifier.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  ListView(
                    children: const [
                      HomePageMainImageWidget(),
                      VerticalMovieListWidget(
                          title: 'Continue Watching for Nivea C M'),
                      kheight10,
                      VerticalMovieListWidget(title: 'Popular on Netflix'),
                      kheight10,
                      VerticalMovieListWidget(title: 'Trending Now'),
                      kheight10,
                      VerticalMovieListWidget(title: 'Tv Shows Based on Books'),
                      kheight10,
                      VerticalMovieListWidget(title: 'New Releases'),
                      kheight10,
                      ///////////games
                      VerticalMovieListWidget(title: 'Tv Dramas'),
                      kheight10,
                      ///////stackk with number
                      ImageListwithNumberWidget(),
                      kheight10,
                      VerticalMovieListWidget(title: 'US Movies'),
                      kheight10,
                    ],
                  ),
                  scrollDirection
                      ? const ScrollRespensiveAppBarWidget()
                      : kheight5,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
