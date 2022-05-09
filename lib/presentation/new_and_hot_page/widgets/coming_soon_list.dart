import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_ui/presentation/new_and_hot_page/screen_new_and_hot_page.dart';
import '../../../application/hot_and_new/hotandnew_bloc.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../../core/strings.dart';

class ComingSoonListWidget extends StatelessWidget {
  const ComingSoonListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      BlocProvider.of<HotandnewBloc>(context).add(const LoadDataInComingSoon());
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
        } else if (state.comingSoonList.isEmpty) {
          return const Center(child: Text('Error occured while fetching data'));
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const ListViewTitleWidgets(title: '🍿  Coming Soon'),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext _ctx, int _int) {
                  final movie = state.comingSoonList[_int];
                  if (movie.id == null) {
                    return const SizedBox();
                  }
                  final _date = DateTime.parse(movie.releaseDate!);
                  final formatedDate = DateFormat.yMMMMd('en_US').format(_date);
                  return ComingSoonWidget(
                    date: movie.releaseDate.toString(),
                    id: movie.id.toString(),
                    month: formatedDate.split(' ').first.substring(0, 3),
                    day: movie.releaseDate!.split('-')[1],
                    posterPath: "$kAppentUrl${movie.backdropPath}",
                    movieName: movie.originalTitle ?? 'No title',
                    description: movie.overview ?? 'No description',
                  );
                },
                itemCount: state.comingSoonList.length,
              )
            ],
          );
        }
      },
    );
  }
}

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;
  final String date;
  const ComingSoonWidget({
    Key? key,
    required this.date,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  kheight5,
                  Text(
                    month,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: greyColor,
                    ),
                  ),
                  Text(
                    day,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MovieImageWidget(
                    imageUrl: posterPath,
                    width: MediaQuery.of(context).size.width - 50),
                RemindAndInfoButtonRow(
                  movieName: movieName,
                ),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 14,
                    color: offWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                kheight10,
                SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Text(
                    movieName,
                    style: const TextStyle(
                      fontSize: 16,
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                kheight10,
                MovieDescriptionWidget(description: description),
                kheight10,
                Row(
                  children: const [
                    RelatedKeyWordWidget(keyword: 'Ominous'),
                    RelatedKeyWordWidget(keyword: 'Dark'),
                    RelatedKeyWordWidget(keyword: 'Emotional'),
                    RelatedKeyWordWidget(keyword: 'Mystery'),
                    RelatedKeyWordWidget(keyword: 'Thriller'),
                    RelatedKeyWordWidget(
                      keyword: 'Drama',
                      iconIsVisible: false,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
