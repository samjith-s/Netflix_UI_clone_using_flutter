import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_ui/core/colors/colors.dart';
import 'package:netflix_ui/core/constants.dart';

class VerticalMovieListWidget extends StatelessWidget {
  final String title;
  const VerticalMovieListWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

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
              return const HomePageVerticalImage();
            },
            separatorBuilder: (BuildContext _ctx, int _index) {
              return const SizedBox(width: 6);
            },
            itemCount: 10,
          ),
        )
      ],
    );
  }
}

class HomePageVerticalImage extends StatelessWidget {
  const HomePageVerticalImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(right: 6),
      width: 105,
      height: 157,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(4),
        image: const DecorationImage(
          image: NetworkImage(
              'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/cXUqtadGsIcZDWUTrfnbDjAy8eN.jpg'),
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
