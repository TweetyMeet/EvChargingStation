

import 'dart:async';

import 'package:flutter/material.dart';

import '../screens/Login_Screen/Log_in.dart';

class SplashServices {

    void isLogin(BuildContext context){


      Timer(Duration(seconds: 4),  ()=>
          Navigator.push(context,MaterialPageRoute(builder: (context)=>LogIN()))

       );
    }
}