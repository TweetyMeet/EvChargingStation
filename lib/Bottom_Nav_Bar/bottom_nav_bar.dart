import 'package:ev_project/constants/constants.dart';
import 'package:ev_project/screens/homescreen/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
int _currentIndex = 0;
late int selected_current_index;

List<Widget> screens = [HomePage(),SearchScreen(),TagScreen(),ProfileScreen()];

class _Bottom_Nav_BarState extends State<Bottom_Nav_Bar> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: white,
          child: Padding(
            padding: EdgeInsets.all(screenWidth*0.02),
            child: GNav(
              selectedIndex: pageRout,
              backgroundColor: white,
              tabBackgroundColor: skyBlue.withOpacity(0.7),
              color: black,
              activeColor: green,
              padding: EdgeInsets.all(screenWidth*0.035),
              gap: 10,
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
        body: screens[pageRout]
      ),
    );
  }
  void onTabTapped(int index) {
    setState(() {
     _currentIndex = index;
    });
  }

  Future<bool> _onBackPressed() async{
    if (_currentIndex != 0) {
      setState(() {
        _currentIndex = 0;
      });
      return Future.value(false);
    }

     return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Do you want to exit the app'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () =>  SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
            child: Text('Yes'),
          ),
        ],
      ),
    ).then((value) => value ?? false);
  }
}
