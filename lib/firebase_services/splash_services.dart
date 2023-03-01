

import 'dart:async';

import 'package:ev_project/screens/homescreen/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/Login_Screen/Log_in.dart';
import '../Bottom_Nav_Bar/bottom_nav_bar.dart';

class SplashServices {

    void isLogin(BuildContext context){

      final auth = FirebaseAuth.instance;
      final user = auth.currentUser;
      if(user != null){
        Timer(Duration(seconds: 4),  ()=>
            Navigator.push(context,MaterialPageRoute(builder: (context)=>Bottom_Nav_Bar())));
      }else{
      Timer(Duration(seconds: 4),  ()=>
          Navigator.push(context,MaterialPageRoute(builder: (context)=>LogIN())));
            }

    }
}