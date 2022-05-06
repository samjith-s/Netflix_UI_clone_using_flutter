import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';

class ColumnOfIconsWidget extends StatelessWidget {
  const ColumnOfIconsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15, right: 13),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              ProfileImageNameWidget(
                accountName: 'VIR DAS',
              ),
              IconAndTextWidget(
                title: 'LOL',
                icon: Icons.emoji_emotions,
              ),
              IconAndTextWidget(
                title: 'My List',
                icon: Icons.add,
              ),
              IconAndTextWidget(
                title: 'Share',
                icon: Icons.share,
              ),
              IconAndTextWidget(
                title: 'Play',
                icon: Icons.play_arrow,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileImageNameWidget extends StatelessWidget {
  final String accountName;
  const ProfileImageNameWidget({
    Key? key,
    required this.accountName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CircleAvatar(
          backgroundColor: blackColor,
          radius: 25,
        ),
        Positioned(
          bottom: -3,
          left: 6,
          child: Text(
            accountName,
            style: GoogleFonts.roboto(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}

class IconAndTextWidget extends StatelessWidget {
  final Color textColor;
  final Color iconColor;
  final double iconSize;
  final void Function()? onPressed;
  final IconData icon;
  final String title;
  const IconAndTextWidget({
    Key? key,
    required this.icon,
    required this.title,
    this.onPressed,
    this.textColor = whiteColor,
    this.iconColor = whiteColor,
    this.iconSize = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: onPressed ?? () {},
          icon: Icon(
            icon,
            color: iconColor,
            size: iconSize,
          ),
        ),
        kheight5,
        Text(
          title,
          style: GoogleFonts.roboto(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
