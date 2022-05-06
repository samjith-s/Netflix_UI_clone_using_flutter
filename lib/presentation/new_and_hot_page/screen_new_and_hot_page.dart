import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_ui/core/colors/colors.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/presentation/fast_laughs_page/screen_fast_laughs.dart';
import 'package:netflix_ui/presentation/fast_laughs_page/widgets/widgets_column.dart';
import 'package:netflix_ui/presentation/new_and_hot_page/widgets/new_and_hot_appbar.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
            VisibilityDetector(
                key: thirdkey,
                child: const TopTenListWidget(),
                onVisibilityChanged: (visibility) {
                  if (visibility.visibleFraction != 0) {
                    buttonColorNotifier.value = 3;
                  }
                }),
          ],
        ),
      ),
    );
  }
}

class EveryonesWatchingListWidget extends StatelessWidget {
  const EveryonesWatchingListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kheight10,
        const ListViewTitleWidgets(title: "🔥 Everyone's Watching"),
        const SizedBox(height: 18),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext _ctx, int _index) {
            return SizedBox(
              width: double.infinity,
              //height: 365,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MovieImageWidget(
                      width: double.infinity,
                      imageUrl:
                          'https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/56v2KjBlU4XaOv9rVYEQypROD7P.jpg',
                      borderRadius: 10,
                    ),
                    kheight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        IconAndTextWidget(
                          icon: Icons.telegram,
                          title: 'Share',
                          iconSize: 28,
                          textColor: greyColor,
                        ),
                        kwidth15,
                        IconAndTextWidget(
                          icon: Icons.add,
                          title: 'My List',
                          iconSize: 28,
                          textColor: greyColor,
                        ),
                        kwidth15,
                        IconAndTextWidget(
                          icon: Icons.play_arrow,
                          title: "Play",
                          iconSize: 28,
                          textColor: greyColor,
                        ),
                        kwidth15,
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "The Adam Project",
                      style: TextStyle(
                        fontSize: 16,
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kheight10,
                    const MovieDescriptionWidget(
                      description:
                          'This 2022 time-travel adventure featuring Ryan Reynolds and Zoe Saldafla was directed by Shawn Levy.',
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
          },
          itemCount: 10,
        ),
      ],
    );
  }
}

class ComingSoonListWidget extends StatelessWidget {
  const ComingSoonListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const ListViewTitleWidgets(title: '🍿  Coming Soon'),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext _ctx, int _int) {
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
                        children: const [
                          kheight5,
                          Text(
                            'APR',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: greyColor,
                            ),
                          ),
                          Text(
                            '15',
                            style: TextStyle(
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
                            imageUrl:
                                'https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/56v2KjBlU4XaOv9rVYEQypROD7P.jpg',
                            width: MediaQuery.of(context).size.width - 50),
                        const RemindAndInfoButtonRow(),
                        const Text(
                          'Season 1 Coming Friday',
                          style: TextStyle(
                            fontSize: 14,
                            color: offWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        kheight10,
                        const Text(
                          "Mai: A Mother's Rage",
                          style: TextStyle(
                            fontSize: 16,
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        kheight10,
                        const MovieDescriptionWidget(
                          description:
                              "A grieving mother descovers the criminals behind her daughter's tragic death, and transforms from meek to merciless to get real story.",
                        ),
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
          },
          itemCount: 10,
        ),
      ],
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
  const RemindAndInfoButtonRow({
    Key? key,
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
            children: const [
              IconAndTextWidget(
                icon: Icons.notifications_none,
                title: 'Remind Me',
                textColor: greyColor,
                iconSize: 22,
              ),
              SizedBox(width: 20),
              IconAndTextWidget(
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

class TopTenListWidget extends StatelessWidget {
  const TopTenListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kheight10,
        const ListViewTitleWidgets(title: "🔥 Top Ten"),
        const SizedBox(height: 18),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext _ctx, int _index) {
            return SizedBox(
              width: double.infinity,
              height: 365,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MovieImageWidget(
                      width: double.infinity,
                      imageUrl:
                          'https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/56v2KjBlU4XaOv9rVYEQypROD7P.jpg',
                      borderRadius: 10,
                    ),
                    kheight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        IconAndTextWidget(icon: Icons.telegram, title: 'Share'),
                        kwidth10,
                        IconAndTextWidget(icon: Icons.add, title: 'My List'),
                        kwidth10,
                        IconAndTextWidget(
                            icon: Icons.play_arrow, title: "Play"),
                        kwidth10,
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "The Adam Project",
                      style: TextStyle(
                        fontSize: 16,
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kheight10,
                    const MovieDescriptionWidget(
                      description:
                          'This 2022 time-travel adventure featuring Ryan Reynolds and Zoe Saldafla was directed by Shawn Levy.',
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
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: 10,
        ),
      ],
    );
  }
}
