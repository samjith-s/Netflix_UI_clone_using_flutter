import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_ui/application/search/search_bloc.dart';
import 'package:netflix_ui/core/strings.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TopTitleWidget(
          title: 'Top Searches',
        ),
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.isError) {
                return const Center(
                  child: Text('error occured'),
                );
              } else if (state.idleList.isEmpty) {
                return const SizedBox();
              } else {
                return ListView.builder(
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
                                  "$kAppentUrl${state.idleList[index].posterPath!}",
                            ),
                            kwidth10,
                            SearchlistMovieName(
                              movieName: state.idleList[index].title ??
                                  'No name provided',
                            ),
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
                  itemCount: state.idleList.length,
                );
              }
            },
          ),
        ),
      ],
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
    return SizedBox(
      width: 150,
      child: Text(
        movieName,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: offWhite,
        ),
      ),
    );
  }
}
