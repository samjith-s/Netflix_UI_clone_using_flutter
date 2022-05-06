import 'package:flutter/material.dart';
import '../../../core/colors/colors.dart';
import '../../fast_laughs_page/widgets/widgets_column.dart';

class HomePageBottomButtons extends StatelessWidget {
  const HomePageBottomButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const IconAndTextWidget(icon: Icons.add, title: 'My List'),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: SizedBox(
            height: 30,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.play_arrow,
                color: blackColor,
              ),
              label: const Text(
                'Play',
                style: TextStyle(color: blackColor),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  whiteColor,
                ),
              ),
            ),
          ),
        ),
        const IconAndTextWidget(
          icon: Icons.info_outline_rounded,
          title: 'Info',
        )
      ],
    );
  }
}
