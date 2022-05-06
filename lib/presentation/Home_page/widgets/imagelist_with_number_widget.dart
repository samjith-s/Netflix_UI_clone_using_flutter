import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import 'vertical_movie_listview_section.dart';

class ImageListwithNumberWidget extends StatelessWidget {
  const ImageListwithNumberWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeListviewTitleWidget(title: 'Top 10 in India Today'),
        kheight5,
        SizedBox(
          height: 157,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext _ctx, int _intex) {
                return SizedBox(
                  width: 140,
                  height: 157,
                  child: Stack(
                    children: [
                      const Align(
                        alignment: Alignment.centerRight,
                        child: HomePageVerticalImage(),
                      ),
                      Positioned(
                        bottom: -26,
                        left: 0,
                        child: BorderedText(
                          strokeWidth: 4.0,
                          strokeColor: whiteColor,
                          child: Text(
                            '${_intex + 1}',
                            style: const TextStyle(
                                color: blackColor,
                                fontSize: 116,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
