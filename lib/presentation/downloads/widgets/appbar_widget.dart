import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors/colors.dart';

class AppBarWidget extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Widget leading;
  const AppBarWidget({Key? key, required this.leading, required this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          leading,
          const Spacer(),
          IconButton(
            padding: const EdgeInsets.only(right: 13),
            constraints: const BoxConstraints(),
            onPressed: () {
              print('cast button tapped');
            },
            icon: const Icon(
              Icons.cast,
              color: whiteColor,
              size: 25,
            ),
          ),
          const SizedBox(width: 3),
          Container(
            width: 23,
            height: 23,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(3),
            ),
          )
        ],
      ),
    );
  }
}
