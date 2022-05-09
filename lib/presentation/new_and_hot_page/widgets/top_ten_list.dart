import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../fast_laughs_page/widgets/widgets_column.dart';
import '../screen_new_and_hot_page.dart';

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
