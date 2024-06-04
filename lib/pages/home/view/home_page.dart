import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:wedev_test/barrel/resources.dart';
import 'package:wedev_test/barrel/views.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _bottomNavIndex = 0; //default index of a first screen


  final imageList = <String>[
    'assets/icons/home.png',
    'assets/icons/category.png',
    'assets/icons/cart.png',
    'assets/icons/person.png',
  ];

  final List<Widget> _widgetOptions = <Widget>[
    ProductPage(),

    Container(color: Colors.white,),
    Container(color: Colors.white,),
    Container(color: Colors.white,),
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBody: true,
      body: _widgetOptions.elementAt(_bottomNavIndex),
      floatingActionButton: FloatingActionButton(

        // backgroundColor: LinearGradient(colors: []),
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [Color(0xFFFF679B), Color(0xFFFF7B51)])
          ),
          child: const Center(
            child: Icon(
              Icons.search,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: imageList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive
              ? kPrimaryColor
              : const Color(0xFF6E7FAA);
          return Image.asset(
            imageList[index],
            height: 24,
            width: 24,
            color: color,
          );
        },
        activeIndex: _bottomNavIndex,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.center,
        leftCornerRadius: 15,
        rightCornerRadius: 15,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        shadow: const BoxShadow(
          offset: Offset(0, 2),
          blurRadius: 2,
          spreadRadius: 0.3,
        ),
      ),
    );
  }
}
