import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors/colors.dart';
import 'package:netflix_ui/presentation/Home_page/screen_home_page.dart';
import 'package:netflix_ui/presentation/downloads/screen_downloads_page.dart';
import 'package:netflix_ui/presentation/fast_laughs_page/screen_fast_laughs.dart';
import 'package:netflix_ui/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix_ui/presentation/new_and_hot_page/screen_new_and_hot_page.dart';
import 'package:netflix_ui/presentation/search_page/screen_search_page.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);

  List<Widget> pages = const [
    ScreenHomePage(),
    ScreenNewAndHotPage(),
    ScreenFastLaughsPage(),
    ScreenSearchPage(),
    ScreenDownloadsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ValueListenableBuilder(
        valueListenable: selectedIndexNotifier,
        builder: (BuildContext ctx, int index, _) {
          return pages[index];
        },
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}
