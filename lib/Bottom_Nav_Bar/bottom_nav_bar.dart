import 'package:ev_project/constants/constants.dart';
import 'package:ev_project/screens/homescreen/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../screens/profile_screen/profile_screen.dart';
import '../screens/search_screen/search_screen.dart';
import '../screens/tag_screen/tag_screen.dart';

class Bottom_Nav_Bar extends StatefulWidget {
  const Bottom_Nav_Bar({Key? key}) : super(key: key);

  @override
  State<Bottom_Nav_Bar> createState() => _Bottom_Nav_BarState();
}

int pageRout = 0;

List<Widget> screens = [HomePage(),SearchScreen(),TagScreen(),ProfileScreen()];

class _Bottom_Nav_BarState extends State<Bottom_Nav_Bar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: white,
        child: Padding(
          padding: const EdgeInsets.all(8.0).w,
          child: GNav(
            backgroundColor: white,
            tabBackgroundColor: skyBlue.withOpacity(0.7),
            color: black,
            activeColor: green,
            padding: EdgeInsets.all(15).w,
            gap: 10.w,
            onTabChange: (value) {
              setState(() {
                pageRout = value ;
              });
            },
            tabs: [
              GButton(icon: Icons.home_outlined,text: 'Home'),
              GButton(icon: Icons.search,text: 'Search',),
              GButton(icon: Icons.bookmark_border,text: 'Tag',),
              GButton(icon: Icons.person_outline,text: 'Profile',),
            ],
          ),
        ),
      ),
      body: screens[pageRout],
    );
  }
}
