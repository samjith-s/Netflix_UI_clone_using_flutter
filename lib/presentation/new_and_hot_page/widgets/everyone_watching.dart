import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../application/hot_and_new/hotandnew_bloc.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../../core/strings.dart';
import '../../fast_laughs_page/widgets/widgets_column.dart';
import '../screen_new_and_hot_page.dart';

class EveryonesWatchingListWidget extends StatelessWidget {
  const EveryonesWatchingListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      BlocProvider.of<HotandnewBloc>(context)
          .add(const LoadDataInEveryoneIsWatching());
    });
    return BlocBuilder<HotandnewBloc, HotandnewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
              child: CircularProgressIndicator(
            strokeWidth: 2,
            color: whiteColor,
          ));
        } else if (state.isError) {
          return const Center(child: Text('Error occured while fetching data'));
        } else if (state.everyoneIsWatchingList.isEmpty) {
          return const Center(child: Text('Error occured while fetching data'));
        } else {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext _ctx, int _index) {
              final movie = state.everyoneIsWatchingList[_index];
              if (movie.id == null) {
                return const SizedBox();
              }
              return Column(
                children: [
                  kheight10,
                  const ListViewTitleWidgets(title: "🔥 Everyone's Watching"),
                  const SizedBox(height: 18),
                  EveryoneIsWatchingWidget(
                    posterPath: "$kAppentUrl${movie.backdropPath}",
                    movieName: movie.title ?? 'No title',
                    description: movie.overview ?? 'No description',
                  )
                ],
              );
            },
            itemCount: state.everyoneIsWatchingList.length - 1,
          );
        }
      },
    );
  }
}

class EveryoneIsWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;
  const EveryoneIsWatchingWidget({
    Key? key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      //height: 365,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieImageWidget(
              width: double.infinity,
              imageUrl: posterPath,
              borderRadius: 10,
            ),
            kheight10,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                    child: Text(
                  movieName,
                  style: GoogleFonts.teko(fontSize: 28, height: 1),
                )),
                const IconAndTextWidget(
                  icon: Icons.telegram,
                  title: 'Share',
                  iconSize: 28,
                  textColor: greyColor,
                ),
                kwidth15,
                const IconAndTextWidget(
                  icon: Icons.add,
                  title: 'My List',
                  iconSize: 28,
                  textColor: greyColor,
                ),
                kwidth15,
                const IconAndTextWidget(
                  icon: Icons.play_arrow,
                  title: "Play",
                  iconSize: 28,
                  textColor: greyColor,
                ),
                kwidth15,
              ],
            ),
            const SizedBox(height: 20),
            Text(
              movieName,
              style: const TextStyle(
                fontSize: 16,
                color: whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            kheight10,
            MovieDescriptionWidget(
              description: description,
            ),
            kheight10,
            Row(
              children: const [
                RelatedKeyWordWidget(keyword: 'Witty'),
                RelatedKeyWordWidget(keyword: 'Feel-Good'),
                RelatedKeyWordWidget(keyword: 'Exciting'),
                RelatedKeyWordWidget(keyword: 'Sci-Fi Adventure'),
                RelatedKeyWordWidget(
                  keyword: 'Action Comedy',
                  iconIsVisible: false,
                ),
              ],
            ),
            kheight15,
          ],
        ),
      ),
    );
  }
}
