import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_ui/application/home/home_bloc.dart';
import 'package:netflix_ui/application/hot_and_new/hotandnew_bloc.dart';
import 'package:netflix_ui/core/colors/colors.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/core/strings.dart';

import 'package:netflix_ui/presentation/Home_page/widgets/vertical_movie_listview_section.dart';
import 'widgets/homepage_mainimage_widget.dart';
import 'widgets/imagelist_with_number_widget.dart';
import 'widgets/scroll_responsive_appbar_widget.dart';

ValueNotifier<bool> scrollDirectionNotifier = ValueNotifier(true);

class ScreenHomePage extends StatelessWidget {
  const ScreenHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      BlocProvider.of<HotandnewBloc>(context).add(const LoadDataInComingSoon());
      BlocProvider.of<HotandnewBloc>(context)
          .add(const LoadDataInEveryoneIsWatching());
      BlocProvider.of<HomeBloc>(context).add(const LoadNewReleaseData());
      BlocProvider.of<HomeBloc>(context).add(const LoadPopularData());
      BlocProvider.of<HomeBloc>(context).add(const LoadTrendingData());
      BlocProvider.of<HomeBloc>(context).add(const LoadTvDramaData());
    });
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
                    children: [
                      BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          if (state.isLoading) {
                            return const Center(
                                child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: whiteColor,
                            ));
                          } else if (state.isError) {
                            return const Center(
                              child: Text('error occured while fetchng data'),
                            );
                          } else if (state.trendingList.isEmpty) {
                            return const Center(
                              child: Text('error occured while fetchng data'),
                            );
                          } else {
                            return HomePageMainImageWidget(
                              imageUrl:
                                  "$kAppentUrl${state.trendingList[0].posterPath}",
                            );
                          }
                        },
                      ),
                      kheight10,
                      BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          if (state.isLoading) {
                            return const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: whiteColor,
                              ),
                            );
                          } else if (state.isError) {
                            return const Center(
                                child:
                                    Text('error occured while fetching data'));
                          } else if (state.newReleaseList.isEmpty) {
                            return const Center(
                              child: Text('error occured while fetchng data'),
                            );
                          } else {
                            return VerticalMovieListWidget(
                                imageUrlList: state.newReleaseList,
                                title: 'Continue Watching for Nivea C M');
                          }
                        },
                      ),
                      kheight10,
                      BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          if (state.isLoading) {
                            return const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: whiteColor,
                              ),
                            );
                          } else if (state.isError) {
                            return const Center(
                                child:
                                    Text('error occured while fetching data'));
                          } else if (state.popularList.isEmpty) {
                            return const Center(
                              child: Text('error occured while fetchng data'),
                            );
                          } else {
                            return VerticalMovieListWidget(
                                imageUrlList: state.popularList,
                                title: 'Popular on Netflix');
                          }
                        },
                      ),
                      //VerticalMovieListWidget(title: 'Popular on Netflix'),
                      kheight10,
                      BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          if (state.isLoading) {
                            return const Center(
                                child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: whiteColor,
                            ));
                          } else if (state.isError) {
                            return const Center(
                                child:
                                    Text('error occured while fetching data'));
                          } else if (state.trendingList.isEmpty) {
                            return const Center(
                              child: Text('error occured while fetchng data'),
                            );
                          } else {
                            return VerticalMovieListWidget(
                                imageUrlList: state.trendingList,
                                title: 'Trending Now');
                          }
                        },
                      ),
                      //VerticalMovieListWidget(title: 'Trending Now'),
                      kheight10,
                      BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          if (state.isLoading) {
                            return const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: whiteColor,
                              ),
                            );
                          } else if (state.isError) {
                            return const Center(
                                child:
                                    Text('error occured while fetching data'));
                          } else if (state.tvDramaList.isEmpty) {
                            return const Center(
                              child: Text('error occured while fetchng data'),
                            );
                          } else {
                            return VerticalMovieListWidget(
                                imageUrlList: state.tvDramaList,
                                title: 'Tv Shows Based on Books');
                          }
                        },
                      ),
                      //VerticalMovieListWidget(title: 'Tv Shows Based on Books'),
                      kheight10,
                      BlocBuilder<HotandnewBloc, HotandnewState>(
                        builder: (context, state) {
                          if (state.isLoading) {
                            return const Center(
                                child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: whiteColor,
                            ));
                          } else if (state.isError) {
                            return const Center(
                                child:
                                    Text('error occured while fetching data'));
                          } else if (state.comingSoonList.isEmpty) {
                            return const Center(
                              child: Text('error occured while fetchng data'),
                            );
                          } else {
                            return VerticalMovieListWidget(
                                imageUrlList: state.comingSoonList,
                                title: 'Tv Dramas');
                          }
                        },
                      ),
                      kheight10,
                      ///////////games
                      //VerticalMovieListWidget(title: 'Tv Dramas'),
                      kheight10,
                      ///////stackk with number
                      BlocBuilder<HotandnewBloc, HotandnewState>(
                        builder: (context, state) {
                          if (state.isLoading) {
                            return const Center(
                                child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: whiteColor,
                            ));
                          } else if (state.isError) {
                            return const Center(
                                child:
                                    Text('error occured while fetching data'));
                          } else if (state.everyoneIsWatchingList.isEmpty) {
                            return const Center(
                              child: Text('error occured while fetchng data'),
                            );
                          } else {
                            return ImageListwithNumberWidget(
                              imageUrlList: state.everyoneIsWatchingList,
                            );
                          }
                        },
                      ),
                      //ImageListwithNumberWidget(),
                      kheight10,
                      BlocBuilder<HotandnewBloc, HotandnewState>(
                        builder: (context, state) {
                          if (state.isLoading) {
                            return const Center(
                                child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: whiteColor,
                            ));
                          } else if (state.isError) {
                            return const Center(
                                child:
                                    Text('error occured while fetching data'));
                          } else if (state.comingSoonList.isEmpty) {
                            return const Center(
                              child: Text('error occured while fetchng data'),
                            );
                          } else {
                            return VerticalMovieListWidget(
                                imageUrlList: state.comingSoonList,
                                title: 'US Movies');
                          }
                        },
                      ),
                      //VerticalMovieListWidget(title: 'US Movies'),
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
