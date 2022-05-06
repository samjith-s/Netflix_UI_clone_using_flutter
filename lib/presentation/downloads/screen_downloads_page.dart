import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_ui/core/colors/colors.dart';
import 'package:netflix_ui/presentation/downloads/widgets/appbar_widget.dart';

class ScreenDownloadsPage extends StatelessWidget {
  const ScreenDownloadsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final _widgets = [
      const SmartDownloadsSection(),
      IntroTextAndImageSection(size: size),
      const ButtonsSection()
    ];
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarWidget(
          leading: Text(
            'Downloads',
            style: GoogleFonts.heebo(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
        ),
        preferredSize: const Size(
          double.infinity,
          50,
        ),
      ),
      body: SafeArea(
          child: ListView.separated(
        itemBuilder: (BuildContext ctx, int inx) {
          return _widgets[inx];
        },
        separatorBuilder: (BuildContext cxt, int itx) {
          return const SizedBox(height: 50);
        },
        itemCount: _widgets.length,
      )),
    );
  }
}

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 110),
            child: Text(
              'Set Up',
              style: GoogleFonts.rubik(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(height: 5),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(offWhite),
          ),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'See What You Can Download',
              style: GoogleFonts.rubik(
                  fontWeight: FontWeight.w600, color: blackColor),
            ),
          ),
        )
      ],
    );
  }
}

class IntroTextAndImageSection extends StatelessWidget {
  const IntroTextAndImageSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Introducing Downloads for You',
          style: GoogleFonts.heebo(
            fontSize: 21,
            fontWeight: FontWeight.w500,
            color: offWhite,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "We'll download a personalized selection of\nmovies and shows for you, so there's always\nsomething to watch on your device.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
        SizedBox(
          width: size.width,
          height: size.width * .57,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: whiteColor.withOpacity(.2),
                radius: size.width * .25,
              ),
              StackImageContainer(
                size: size,
                url:
                    'https://www.themoviedb.org/t/p/w220_and_h330_face/7RcyjraM1cB1Uxy2W9ZWrab4KCw.jpg',
                angle: -20 * pi / 180,
                rightMargin: 120,
                bottomMargin: 28,
                height: size.height * .152,
              ),
              StackImageContainer(
                size: size,
                url:
                    'https://www.themoviedb.org/t/p/w220_and_h330_face/vUUqzWa2LnHIVqkaKVlVGkVcZIW.jpg',
                angle: 20 * pi / 180,
                leftMargin: 120,
                height: size.height * .152,
                bottomMargin: 28,
              ),
              StackImageContainer(
                size: size,
                url:
                    'https://www.themoviedb.org/t/p/w220_and_h330_face/g4tMniKxol1TBJrHlAtiDjjlx4Q.jpg',
                angle: 0,
                height: size.height * .178,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StackImageContainer extends StatelessWidget {
  final String url;
  final double angle;
  final double leftMargin;
  final double rightMargin;
  final double bottomMargin;
  final double height;
  const StackImageContainer({
    Key? key,
    required this.size,
    required this.angle,
    this.leftMargin = 0,
    this.rightMargin = 0,
    required this.url,
    this.bottomMargin = 0,
    required this.height,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        margin: EdgeInsets.only(
          top: 10,
          left: leftMargin,
          right: rightMargin,
          bottom: bottomMargin,
        ),
        width: size.width * .28,
        height: height,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              url,
            ),
          ),
        ),
      ),
    );
  }
}

class SmartDownloadsSection extends StatelessWidget {
  const SmartDownloadsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {
              print('smart dialog button clicked');
            },
            icon: const Icon(
              Icons.settings_outlined,
              color: offWhite,
              size: 25,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'Smart Downloads',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: offWhite,
            ),
          )
        ],
      ),
    );
  }
}
