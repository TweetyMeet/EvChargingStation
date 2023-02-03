import 'package:ev_project/constants/constants.dart';
import 'package:flutter/material.dart';

import 'components/;ogindetails.dart';
import 'components/background_desgin.dart';
import 'components/bottomcontainer.dart';



class LogIN extends StatelessWidget {
  const LogIN({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              BackgroundDesign(),
              LoginDetails(),
              BottomContainer(),

            ],
          ),
        ),
      ),

    );
  }
}
