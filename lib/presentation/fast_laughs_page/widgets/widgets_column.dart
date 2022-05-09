import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_ui/presentation/fast_laughs_page/screen_fast_laughs.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';

class ColumnOfIconsWidget extends StatelessWidget {
  final String? image;
  const ColumnOfIconsWidget({
    Key? key,
    required this.image,
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
            children: [
              ProfileImageNameWidget(
                image: image,
                accountName: 'VIR DAS',
              ),
              const IconAndTextWidget(
                title: 'LOL',
                icon: Icons.emoji_emotions,
              ),
              const IconAndTextWidget(
                title: 'My List',
                icon: Icons.add,
              ),
              GestureDetector(
                onTap: () {
                  final movieName =
                      VideoListItemInheritedWidget.of(context)?.movieData.title;
                  if (movieName != null) {
                    Share.share(movieName);
                  }
                },
                child: const IconAndTextWidget(
                  title: 'Share',
                  icon: Icons.share,
                ),
              ),
              const IconAndTextWidget(
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
  final String? image;
  final String accountName;
  const ProfileImageNameWidget({
    Key? key,
    required this.accountName,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: image == null ? null : NetworkImage(image!),
      radius: 25,
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
