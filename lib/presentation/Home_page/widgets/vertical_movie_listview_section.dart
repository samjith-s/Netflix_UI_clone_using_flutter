import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_ui/core/colors/colors.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/core/strings.dart';
import 'package:netflix_ui/domain/hot_and_new/model/hot_and_new_resp.dart';

import '../../../domain/home/model/home.dart';

class VerticalMovieListWidget extends StatelessWidget {
  final List imageUrlList;
  final String title;
  const VerticalMovieListWidget(
      {Key? key, required this.title, required this.imageUrlList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeListviewTitleWidget(
          title: title,
        ),
        kheight5,
        SizedBox(
          height: 157,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext _ctx, int _index) {
              final _movie = imageUrlList[_index];
              return HomePageVerticalImage(
                imageUrl: "$kAppentUrl${_movie.posterPath}",
              );
            },
            separatorBuilder: (BuildContext _ctx, int _index) {
              return const SizedBox(width: 6);
            },
            itemCount: imageUrlList.length,
          ),
        )
      ],
    );
  }
}

class HomePageVerticalImage extends StatelessWidget {
  final String imageUrl;
  const HomePageVerticalImage({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(right: 6),
      width: 105,
      height: 157,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(4),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}

class HomeListviewTitleWidget extends StatelessWidget {
  final String title;
  const HomeListviewTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.rubik(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: offWhite,
      ),
    );
  }
}
