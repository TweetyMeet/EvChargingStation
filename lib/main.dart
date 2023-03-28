import 'package:ev_project/Bottom_Nav_Bar/bottom_nav_bar.dart';
import 'package:ev_project/screens/Login_Screen/Log_in.dart';
import 'package:ev_project/screens/splash_screen.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Neumorphic Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Splash(),

    );
  }
}

