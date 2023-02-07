import 'package:ev_project/screens/Login_Screen/Log_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class  HomePage extends StatefulWidget {
  const HomePage ({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            FirebaseAuth _auth = FirebaseAuth.instance;
            _auth.signOut().then((value) => {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIN()))
              
            });
            
          }, icon: Icon(Icons.arrow_back_ios_outlined))
        ],
      ),
      body: Center(
        child: Text('Hi'),
      ),
    );
  }
}
