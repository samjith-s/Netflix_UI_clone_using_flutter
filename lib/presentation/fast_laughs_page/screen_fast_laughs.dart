import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors/colors.dart';
import 'widgets/widgets_column.dart';

class ScreenFastLaughsPage extends StatelessWidget {
  const ScreenFastLaughsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView(
        scrollDirection: Axis.vertical,
        children: List.generate(20, (index) {
          return Container(
            child: Stack(
              children: const [
                MuteIconWidget(size: 24,),
                ColumnOfIconsWidget(),
              ],
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/cXUqtadGsIcZDWUTrfnbDjAy8eN.jpg',
              ),
              fit: BoxFit.fill,
            )),
          );
        }),
      )),
    );
  }
}

class MuteIconWidget extends StatelessWidget {
  final double size;
  const MuteIconWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: IconButton(
        padding: const EdgeInsets.only(bottom: 5),
        onPressed: () {},
        icon: Icon(
          Icons.volume_off,
          color: whiteColor,
          size: size,
        ),
      ),
    );
  }
}
