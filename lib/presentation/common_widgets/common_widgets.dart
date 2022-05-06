import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';

class CommonVImageContainer extends StatelessWidget {
  final String url;
  const CommonVImageContainer({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
        color: offWhite,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class CommonHImageContainer extends StatelessWidget {
  final String url;
  const CommonHImageContainer({
    Key? key,
    required Size size,
    required this.url,
  })  : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      width: _size.width * .35,
      height: _size.height * .09,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: greyColor,
        image: DecorationImage(
          image: NetworkImage(
            url,
          ),
        ),
      ),
    );
  }
}
