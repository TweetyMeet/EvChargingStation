import 'dart:async';

import 'package:ev_project/firebase_services/splash_services.dart';
import 'package:ev_project/screens/Login_Screen/Log_in.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  SplashServices splash = SplashServices();
  @override

  late AnimationController controller;

  void dispose(){
    super.dispose();
    controller.dispose();
  }


  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    super.initState();
    splash.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Lottie.network("https://assets5.lottiefiles.com/packages/lf20_o1ebw8km.json")
      ),
    );

  }
}
