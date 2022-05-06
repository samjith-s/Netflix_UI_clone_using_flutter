import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_ui/core/colors/colors.dart';
import 'package:netflix_ui/core/constants.dart';

import '../common_widgets/common_widgets.dart';
import 'widgets/search_idle_result_widget.dart';
import 'widgets/search_result_widget.dart';

class ScreenSearchPage extends StatelessWidget {
  const ScreenSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
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
            ),
            kheight10,
            //const SearchIdleResultWidget()
            const SearchResultWidgets()
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
