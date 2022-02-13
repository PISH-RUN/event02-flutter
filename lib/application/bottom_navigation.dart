import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kid_need_pishrun_event_02/application/colors.dart';

const double iconSize = 36;
const double paddingSize = 6;

class BottomNavigation extends StatelessWidget {
  final int currentIndexBottomNavigation;
  final bool visible;

  BottomNavigation({
    Key key,
    @required int currentIndexBottomNavigation,
    this.visible = true,
  })  : this.currentIndexBottomNavigation = currentIndexBottomNavigation,
        super(key: key);

  double iconSize = 20.0;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SizedBox(height: iconSize, width: iconSize, child: SvgPicture.asset("images/ionic/play-sharp.svg", color: green)),
            activeIcon: SizedBox(height: iconSize, width: iconSize, child: SvgPicture.asset("images/ionic/play-sharp.svg", color: green)),
            label: 'از همه رنگ',
            backgroundColor: Colors.white,
          ),
        ],
        onTap: (index) {
          if (index == currentIndexBottomNavigation) return;
        },
        currentIndex: currentIndexBottomNavigation,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 11,
          color: Colors.black,
        ),
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.black,
        ),
        selectedIconTheme: IconThemeData(color: Colors.black, opacity: 1.0, size: 30),
        unselectedIconTheme: IconThemeData(color: Colors.black, opacity: 0.4, size: 30),
      ),
    );
  }

  SizedBox disableIconWidget(String imgAddress) =>
      SizedBox(width: iconSize, height: iconSize, child: Image(color: Colors.grey, image: AssetImage(imgAddress)));

  SizedBox activeIconWidget(String imgAddress) {
    return SizedBox(width: iconSize, height: iconSize, child: Image(image: AssetImage(imgAddress)));
  }
}
