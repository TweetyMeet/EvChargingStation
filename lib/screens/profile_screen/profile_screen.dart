import 'package:ev_project/screens/Login_Screen/Log_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        body: Column(
          children: [
            SizedBox(height: 10,),
            Row(children :[
              SizedBox(width: 16,),
              Icon(Icons.arrow_back_ios_outlined),
              SizedBox(width: 16,),
              Text('Profile',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ],
            ),
            SizedBox(height: 15,),
            CircleAvatar(
              radius: 40,
              backgroundImage:  AssetImage("assets/PHOTO.png")),

            SizedBox(height: 10,),
            Text('Meet Pansuriya',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            Text('India',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            ListTile(

              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.tealAccent.withOpacity(0.1),
                ),
                child: Icon(Icons.man_rounded,color: Colors.black,),
              ),
              title: Text('My Profile',),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Icon(Icons.arrow_forward_ios_rounded),
              ),

            ),
            ListTile(
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.tealAccent.withOpacity(0.1),
                ),
                child: Icon(Icons.save_sharp,color: Colors.black,),
              ),
              title: Text('Saved Slots',),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Icon(Icons.arrow_forward_ios_rounded),
              ),

            ),
            ListTile(
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.tealAccent.withOpacity(0.1),
                ),
                child: Icon(Icons.bookmark,color: Colors.black,),
              ),
              title: Text('My Booking',),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Icon(Icons.arrow_forward_ios_rounded),
              ),

            ),
            ListTile(
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.tealAccent.withOpacity(0.1),
                ),
                child: Icon(Icons.car_crash_sharp,color: Colors.black,),
              ),
              title: Text('My Car',),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Icon(Icons.arrow_forward_ios_rounded),
              ),

            ),
            ListTile(
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.tealAccent.withOpacity(0.1),
                ),
                child: Icon(Icons.settings,color: Colors.black,),
              ),
              title: Text('Setting',),
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Icon(Icons.arrow_forward_ios_rounded),
              ),

            ),
            SizedBox(height: 54,),

            Container(
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,

              ),
              child: OutlinedButton(

                onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context)=> LogIN()));

                  },

                child: Text('Log Out',style: TextStyle(color: Colors.white),),
              )
            )
          ],
        ),

      ),
    );
  }
}
