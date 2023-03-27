

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev_project/Bottom_Nav_Bar/bottom_nav_bar.dart';
import 'package:ev_project/screens/profile_screen/edit_profile.dart';
import 'package:ev_project/screens/profile_screen/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/constants.dart';


class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);


  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();

  Future apcall()async{
    final dbRef = await FirebaseFirestore.instance.collection('users');
    dbRef.doc(FirebaseAuth.instance.currentUser!.uid).get().
    then((DocumentSnapshot<Map<String, dynamic>>snapshot) {
      name.text = snapshot['name'];
      phone.text = snapshot['phone'];
      email.text = snapshot['email'];
      String profilePic = snapshot['profilePic'].toString();
      lists(profilePic);
    });
  }

  void lists(main){
    setState(() {
      hello = main;
      });
  }

 String? hello;

  @override
  void initState() {
      apcall();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: screenWidth*0.03),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_Nav_Bar()));
                          },
                          child: Image(image: AssetImage('assets/icons/back-arrow.png'),color: black,
                            width: screenWidth*0.08,height: screenHeight*0.08,)),
                      SizedBox(width: screenWidth*0.01),
                      Text(
                        'Profile',
                        style: TextStyle(fontSize: screenWidth*0.065, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight*0.020,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth*0.035),
                    child: GestureDetector(
                      onTap: () async{
                        final  pickImage = await ImagePicker().pickImage(
                            source:ImageSource.gallery,
                          imageQuality: 50,
                        );
                        if(pickImage != null){
                          setState(() {
                            hello = pickImage!.path;
                      });
                        }

                      },
                      child: Container(
                        child:  hello == null ?
                        CircleAvatar(
                          radius: 70,
                          backgroundColor: green.withOpacity(0.5),

                          child: Image.asset("assets/images/add-photo.png",
                            height: 80,
                            width: 80,
                          ),
                        ) :
                        hello.toString().contains('http') ?
                        CircleAvatar(
                            radius: 70,
                            backgroundImage: NetworkImage(hello.toString())
                        )
                            : CircleAvatar(
                          radius: 70,
                          backgroundImage: FileImage(File(hello.toString())),
                        ),

                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight*0.049,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.03),
                  child: Card(

                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).w),
                    child: ListTile(
                      title: Text('Name  :  '+ name.text.toString(),style:
                      TextStyle(fontSize: screenWidth*0.042,fontWeight: FontWeight.w500),),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:screenWidth*0.03 ),
                  child: Card(
                    // elevation: 7,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).w),
                    child: ListTile(
                      title: Text('Phone  :  '+ phone.text.toString(),style: TextStyle(fontSize: screenWidth*0.042,fontWeight: FontWeight.w500),),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.03),
                  child: Card(
                    // elevation: 7,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).w),
                    child: ListTile(
                      title: Text('Email   :   '+ email.text.toString(),style: TextStyle(fontSize: screenWidth*0.042,fontWeight: FontWeight.w500),),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight*0.21),
                Padding(
                  padding:  EdgeInsets.all(screenWidth*0.03),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>editprofile()));
                    },
                    child: Container(
                      height: screenHeight*0.078,
                      width: screenWidth*0.94,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10).w,
                        color: green.withOpacity(0.5),
                      ),
                      child: Center(
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(fontSize: screenWidth*0.05, color: textBlack,fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      );
  }
}
