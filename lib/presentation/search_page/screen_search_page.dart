import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_ui/application/search/search_bloc.dart';
import 'package:netflix_ui/core/colors/colors.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/domain/core/debounce/debounce.dart';
import '../../application/downloads/downloads_bloc.dart';
import 'widgets/search_idle_result_widget.dart';
import 'widgets/search_result_widget.dart';

class ScreenSearchPage extends StatelessWidget {
  ScreenSearchPage({Key? key}) : super(key: key);

  final _debouncer = Debouncer(milliseconds: 1 * 1000);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback(
      (timeStamp) {
        BlocProvider.of<SearchBloc>(context).add(const Initialize());
      },
    );
    //Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kheight10,
            CupertinoSearchTextField(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 96, 95, 95).withOpacity(.3),
                borderRadius: BorderRadius.circular(5),
              ),
              onChanged: (value) {
                if (value.isEmpty) {
                  return;
                }
                _debouncer.run(
                  () {
                    BlocProvider.of<SearchBloc>(context)
                        .add(SearchMovie(movieQuery: value));
                  },
                );
              },
            ),
            kheight10,
            Expanded(child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.searchResultList.isEmpty) {
                  return const SearchIdleResultWidget();
                } else {
                  return const SearchResultWidgets();
                }
              },
            ))
          ],
        ),
      )),
    );
  }
}

class TopTitleWidget extends StatelessWidget {
  final String title;
  const TopTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.rubik(
        fontSize: 16,
        color: offWhite,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
