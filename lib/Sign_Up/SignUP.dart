import 'package:ev_project/constants/constants.dart';
import 'package:flutter/material.dart';

import '../screens/Login_Screen/components/;ogindetails.dart';
import '../screens/Login_Screen/components/background_desgin.dart';
import '../screens/Login_Screen/components/bottomcontainer.dart';





class SignIN extends StatelessWidget {
  const SignIN({Key? key}) : super(key: key);


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
              BottomContainer(title: 'Sign Up', subtitle: 'Log In',),

            ],
          ),
        ),
      ),

    );
  }
}
