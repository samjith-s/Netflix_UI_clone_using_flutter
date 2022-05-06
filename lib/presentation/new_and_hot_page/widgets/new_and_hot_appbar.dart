import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../screen_new_and_hot_page.dart';

final itemkey = GlobalKey();
final dataKey = GlobalKey();
final thirdkey = GlobalKey();

class NewAndHotAppBarWidgets extends StatelessWidget {
  const NewAndHotAppBarWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: blackColor,
      title: Text(
        'New & Hot',
        style: GoogleFonts.heebo(
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        IconButton(
          padding: const EdgeInsets.only(right: 13),
          constraints: const BoxConstraints(),
          onPressed: () {},
          icon: const Icon(
            Icons.cast,
            color: whiteColor,
            size: 25,
          ),
        ),
        const SizedBox(width: 3),
        Padding(
          padding: const EdgeInsets.only(
            right: 15,
            top: 13,
            bottom: 13,
          ),
          child: Container(
            width: 23,
            height: 23,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        )
      ],
      bottom: const PreferredSize(
        preferredSize: Size(double.infinity, 30),
        child: BottonTabButtonWidgets(),
      ),
    );
  }
}

class BottonTabButtonWidgets extends StatelessWidget {
  const BottonTabButtonWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ValueListenableBuilder(
        valueListenable: buttonColorNotifier,
        builder: (BuildContext _ctx, int bottonNo, Widget? _) {
          return ListView(
            scrollDirection: Axis.horizontal,
            children: [
              kwidth5,
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    bottonNo == 1 ? whiteColor : blackColor,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                onPressed: () {
                  buttonColorNotifier.value = 1;
                  Scrollable.ensureVisible(itemkey.currentContext!);
                },
                child: Text(
                  '🍿 Coming Soon',
                  style: TextStyle(
                    color: bottonNo == 1 ? blackColor : whiteColor,
                  ),
                ),
              ),
              kwidth5,
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    bottonNo == 2 ? whiteColor : blackColor,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                onPressed: () {
                  buttonColorNotifier.value = 2;
                  Scrollable.ensureVisible(dataKey.currentContext!);
                },
                child: Text(
                  "🔥 Everyone's Watching",
                  style: TextStyle(
                    color: bottonNo == 2 ? blackColor : whiteColor,
                  ),
                ),
              ),
              kwidth5,
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    bottonNo == 3 ? whiteColor : blackColor,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                onPressed: () {
                  buttonColorNotifier.value = 1;
                  Scrollable.ensureVisible(thirdkey.currentContext!);
                },
                child: Text(
                  '🍿 Top Ten',
                  style: TextStyle(
                    color: bottonNo == 3 ? blackColor : whiteColor,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
