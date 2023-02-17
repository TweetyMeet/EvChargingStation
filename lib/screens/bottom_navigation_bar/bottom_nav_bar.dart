import 'package:ev_project/screens/homescreen/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../profile_screen.dart';
import '../search_screen.dart';
import '../tag_screen.dart';

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
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
            backgroundColor: Colors.black,
            tabBackgroundColor: Colors.grey.shade800,
            color: Colors.white,
            activeColor: Colors.white,
            padding: EdgeInsets.all(15),
            gap: 10,
            onTabChange: (value) {
              setState(() {
                pageRout = value ;
              });
            },
            tabs: [
              GButton(icon: Icons.home_filled,text: 'Home'),
              GButton(icon: Icons.search,text: 'Search'),
              GButton(icon: Icons.bookmark_border,text: 'Tag'),
              GButton(icon: Icons.account_circle_outlined,text: 'Profil'),
            ],
          ),
        ),
      ),
      body: screens[pageRout],
    );
  }
}
