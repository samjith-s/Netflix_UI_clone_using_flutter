import 'package:flutter/material.dart';
import 'homepage_mainimage_bottonbuttons.dart';

class HomePageMainImageWidget extends StatelessWidget {
  const HomePageMainImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .65,
      width: double.infinity,
      child: Stack(
        children: const [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              child: HomePageBottomButtons(),
            ),
          )
        ],
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/pWHf4khOloNVfCxscsXFj3jj6gP.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
