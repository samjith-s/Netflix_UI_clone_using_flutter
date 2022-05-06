import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../common_widgets/common_widgets.dart';
import '../screen_search_page.dart';

class SearchIdleResultWidget extends StatelessWidget {
  const SearchIdleResultWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopTitleWidget(
            title: 'Top Searches',
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (BuildContext ctx, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        CommonHImageContainer(
                          size: _size,
                          url:
                              'https://www.themoviedb.org/t/p/w250_and_h141_face/l0qVZIpXtIo7km9u5Yqh0nKPOr5.jpg',
                        ),
                        kwidth10,
                        const SearchlistMovieName(movieName: 'The Movie Name'),
                      ],
                    ),
                    IconButton(
                      padding: const EdgeInsets.only(right: 15),
                      icon: const Icon(
                        Icons.play_circle_outline,
                        color: offWhite,
                        size: 40,
                      ),
                      onPressed: () {},
                    )
                  ],
                );
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class SearchlistMovieName extends StatelessWidget {
  final String movieName;
  const SearchlistMovieName({
    Key? key,
    required this.movieName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      movieName,
      style: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: offWhite,
      ),
    );
  }
}
