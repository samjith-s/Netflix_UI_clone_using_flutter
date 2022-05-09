import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_ui/core/colors/colors.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/presentation/fast_laughs_page/screen_fast_laughs.dart';
import 'package:netflix_ui/presentation/fast_laughs_page/widgets/widgets_column.dart';
import 'package:netflix_ui/presentation/new_and_hot_page/widgets/new_and_hot_appbar.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'widgets/coming_soon_list.dart';
import 'widgets/everyone_watching.dart';

ValueNotifier<int> buttonColorNotifier = ValueNotifier(1);

class ScreenNewAndHotPage extends StatelessWidget {
  const ScreenNewAndHotPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: NewAndHotAppBarWidgets(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            VisibilityDetector(
              key: itemkey,
              child: const ComingSoonListWidget(),
              onVisibilityChanged: (info) {
                if (info.visibleFraction != 0) {
                  buttonColorNotifier.value = 1;
                }
              },
            ),
            VisibilityDetector(
              key: dataKey,
              child: const EveryonesWatchingListWidget(),
              onVisibilityChanged: (visibilityInfo) {
                if (visibilityInfo.visibleFraction != 0) {
                  buttonColorNotifier.value = 2;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListViewTitleWidgets extends StatelessWidget {
  final String title;
  const ListViewTitleWidgets({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth5,
        Text(
          title,
          style: GoogleFonts.roboto(
            fontSize: 17,
            color: whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class MovieImageWidget extends StatelessWidget {
  final double width;
  final double borderRadius;
  final String imageUrl;
  const MovieImageWidget({
    Key? key,
    required this.width,
    this.borderRadius = 10,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Image(
            image: NetworkImage(
              imageUrl,
            ),
            width: width,
            // height: 300,
          ),
        ),
        const Positioned(
          bottom: 5,
          right: 10,
          child: MuteIconWidget(
            size: 20,
          ),
        )
      ],
    );
  }
}

class RemindAndInfoButtonRow extends StatelessWidget {
  final String movieName;
  const RemindAndInfoButtonRow({
    Key? key,required this.movieName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 0, top: 15, bottom: 10),
      child: SizedBox(
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children:  [
              Expanded(child: Text(movieName,style: GoogleFonts.teko(fontSize: 28,height: 1),)),
              const IconAndTextWidget(
                icon: Icons.notifications_none,
                title: 'Remind Me',
                textColor: greyColor,
                iconSize: 22,
              ),
             const  SizedBox(width: 20),
             const IconAndTextWidget(
                icon: Icons.info_outline,
                title: 'Info',
                textColor: greyColor,
                iconSize: 22,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MovieDescriptionWidget extends StatelessWidget {
  final String description;
  const MovieDescriptionWidget({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      child: Text(
        description,
        style: const TextStyle(
          fontSize: 12,
          color: greyColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class RelatedKeyWordWidget extends StatelessWidget {
  final bool iconIsVisible;
  final String keyword;
  const RelatedKeyWordWidget({
    Key? key,
    required this.keyword,
    this.iconIsVisible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          keyword,
          style: const TextStyle(
            color: offWhite,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Visibility(
            visible: iconIsVisible,
            child: const CircleAvatar(
              radius: 1,
              backgroundColor: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}
