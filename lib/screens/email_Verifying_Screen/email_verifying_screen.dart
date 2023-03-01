import 'dart:async';

import 'package:ev_project/screens/Login_Screen/Log_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class email_verifying_screen extends StatefulWidget {
  const email_verifying_screen({Key? key}) : super(key: key);

  @override
  State<email_verifying_screen> createState() => _email_verifying_screenState();
}

class _email_verifying_screenState extends State<email_verifying_screen> {
  final auth = FirebaseAuth.instance;
  late User user;
  late Timer timer;
  
  @override
  void initState(){
    user = auth.currentUser!;
    user.sendEmailVerification();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
     timer.cancel();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('An email has been sent to ${user.email} please verify'),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser!;
    await user.reload();
    if(user.emailVerified){
      timer.cancel();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LogIN(),));
    }
  }
}
