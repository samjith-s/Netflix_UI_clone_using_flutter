import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/colors/colors.dart';
import '../../downloads/widgets/appbar_widget.dart';

class ScrollRespensiveAppBarWidget extends StatelessWidget {
  const ScrollRespensiveAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Colors.black.withOpacity(.5),
            Colors.black54.withOpacity(.2),
          ],
        ),
      ),
      width: double.infinity,
      height: 130,
      child: Column(
        children: const [
          AppBarWidget(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 45,
              // bottom: 20,
            ),
            leading: Image(
              image: AssetImage(
                'lib/assets/images/netflixlogo.png',
              ),
              width: 20,
              height: 32,
              fit: BoxFit.cover,
            ),
          ),
          SectionUnderAppbarWidget()
        ],
      ),
    );
  }
}

class SectionUnderAppbarWidget extends StatelessWidget {
  const SectionUnderAppbarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'TV Shows',
              style: TextStyle(
                color: whiteColor,
                fontSize: 13,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Movies',
              style: TextStyle(
                color: whiteColor,
                fontSize: 13,
              ),
            ),
          ),
          Row(
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {
                  _showCategoriesList(context);
                },
                child: const Text(
                  'Categories',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 13,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_drop_down,
                color: whiteColor,
              )
            ],
          )
        ],
      ),
    );
  }

  Future<Object?> _showCategoriesList(BuildContext context) {
    return showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 19, 19, 19).withOpacity(.8),
        body: Column(
          children: const [
            SizedBox(height: 50),
            CategoriesListWidget(),
            SizedBox(height: 20),
            ClossButtonWidget(),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (BuildContext _context, int _index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                homeCategories[_index],
                style: GoogleFonts.rubik(
                  fontSize: 18,
                  color: greyColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext _cx, int _indx) {
          return const SizedBox(height: 35);
        },
        itemCount: 20,
      ),
    );
  }
}

class ClossButtonWidget extends StatelessWidget {
  const ClossButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.close),
        color: blackColor,
      ),
      backgroundColor: whiteColor,
      radius: 25,
    );
  }
}

List<String> homeCategories = [
  'Home',
  'My List',
  'Available for Download',
  'Hindi',
  'Thamil',
  'Punjabi',
  'Telugu',
  'Malayalam',
  'Marathi',
  'Bengali',
  'English',
  'Action',
  'Anime',
  'Award Winners',
  'Biographical',
  'Blockbusters',
  'Bollywood',
  'Children & Family',
  'Comedies',
  'Documentaries',
  'Dramas',
  'Fantasy',
  'Hollywood',
  'Hurror',
  'International',
  'Indian'
];
