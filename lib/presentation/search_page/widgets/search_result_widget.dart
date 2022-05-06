import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../common_widgets/common_widgets.dart';
import '../screen_search_page.dart';

class SearchResultWidgets extends StatelessWidget {
  const SearchResultWidgets({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopTitleWidget(title: 'Movies & TV'),
          kheight5,
          Expanded(
            child: GridView.count(
              childAspectRatio: .67,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 3,
              children: List.generate(
                21,
                (index) {
                  return const CommonVImageContainer(
                    url:
                        'https://www.themoviedb.org/t/p/w220_and_h330_face/1BIoJGKbXjdFDAqUEiA2VHqkK1Z.jpg',
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
