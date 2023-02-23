import 'package:ev_project/screens/homescreen/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../profile_screen/profile_screen.dart';
import '../search_screen/search_screen.dart';
import '../tag_screen/tag_screen.dart';

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
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
            backgroundColor: Colors.white,
            // tabBackgroundColor: Colors.grey.shade800,
            color: Colors.black,
            activeColor: Color(0xff25B386),
            padding: EdgeInsets.all(15),
            gap: 10,
            onTabChange: (value) {
              setState(() {
                pageRout = value ;
              });
            },
            tabs: [
              GButton(icon: Icons.home_filled,),
              GButton(icon: Icons.search),
              GButton(icon: Icons.bookmark_border),
              GButton(icon: Icons.person),
            ],
          ),
        ),
      ),
      body: screens[pageRout],
    );
  }
}
