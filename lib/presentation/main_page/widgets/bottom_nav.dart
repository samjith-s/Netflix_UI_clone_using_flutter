import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors/colors.dart';

ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedIndexNotifier,
      builder: (BuildContext ctx, dynamic index, Widget? _) {
        return BottomNavigationBar(
          onTap: ((value) {
            selectedIndexNotifier.value = value;
          }),
          currentIndex: index,
          selectedIconTheme: const IconThemeData(
            color: offWhite,
          ),
          unselectedIconTheme: const IconThemeData(
            color: Colors.grey,
          ),
          selectedItemColor: offWhite,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          backgroundColor: backgroundColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.collections_outlined),
              label: 'New & Hot',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_emotions_outlined),
              label: 'Fast Laugh',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_drop_down_circle_outlined),
              label: 'Downloads',
            ),
          ],
        );
      },
    );
  }
}
