import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/ui/login_page.dart';
import 'package:plant_app/ui/scan_page.dart';
import 'package:plant_app/ui/screens/cart_page.dart';
import 'package:plant_app/ui/screens/favorite_page.dart';
import 'package:plant_app/ui/screens/home_page.dart';
import 'package:plant_app/ui/screens/profile_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _bottomNavIndex = 0; // to control the page index

  // List of the pages
  List<Widget> pages = const [
    HomePage(),
    FavoritePage(),
    CartPage(),
    ProfilePage(),
  ];

  // List of the pages icon
  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  // List of the pages title
  List<String> titleList = [
    'Home',
    'Favorite',
    'Cart',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleList[_bottomNavIndex],
              style: TextStyle(
                color: Constants.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            Icon(
              Icons.notifications,
              color: Constants.blackColor,
              size: 30.0,
            )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: pages,
      ),
      // Plant scan button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              child: const ScanPage(),
              type: PageTransitionType.bottomToTop,
            ),
          );
        },
        child: Image.asset(
          'assets/images/code-scan-two.png',
          height: 30.0,
        ),
        backgroundColor: Constants.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Colors.black.withOpacity(.5),
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
    );
  }
}
