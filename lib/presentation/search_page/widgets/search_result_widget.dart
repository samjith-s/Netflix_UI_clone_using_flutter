import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_ui/application/search/search_bloc.dart';
import 'package:netflix_ui/core/strings.dart';

import '../../../core/constants.dart';
import '../../common_widgets/common_widgets.dart';
import '../screen_search_page.dart';

class SearchResultWidgets extends StatelessWidget {
  const SearchResultWidgets({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TopTitleWidget(title: 'Movies & TV'),
        kheight5,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                childAspectRatio: .67,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 3,
                children: List.generate(
                  state.searchResultList.length,
                  (index) {
                    final movie = state.searchResultList[index];
                    return CommonVImageContainer(
                      url: "$kAppentUrl${movie.posterPath}",
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
