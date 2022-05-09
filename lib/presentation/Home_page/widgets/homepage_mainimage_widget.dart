import 'package:flutter/material.dart';
import 'homepage_mainimage_bottonbuttons.dart';

class HomePageMainImageWidget extends StatelessWidget {
  final String imageUrl;
  const HomePageMainImageWidget({
    Key? key,
    required this.imageUrl,
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
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            imageUrl,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
