

import 'dart:io';

import 'package:ev_project/Bottom_Nav_Bar/bottom_nav_bar.dart';
import 'package:ev_project/screens/profile_screen/edit_profile.dart';
import 'package:ev_project/screens/profile_screen/profile_screen.dart';
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
  String? profilePic;
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25,top: 10).r,
                  child: Row(
                    children: [
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_Nav_Bar()));
                          },
                          child: Image(image: AssetImage('assets/icons/back-arrow.png'),color: black,width: 30.w,height: 30.h,)),
                      Text(
                        'Profile',
                        style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async{
                        final  pickImage = await ImagePicker().pickImage(
                            source:ImageSource.gallery,
                          imageQuality: 50,
                        );
                        if(pickImage != null){
                          setState(() {
                            profilePic = pickImage!.path;
                      });
                        }

                      },
                      child: Container(
                        child: profilePic == null ? CircleAvatar(
                          radius: 70,
                           backgroundColor: Colors.greenAccent,
                           child: Image.asset("assets/images/add-photo.png",
                             height: 80,
                             width: 80,
                           ),

                        ): CircleAvatar(
                          radius: 70,
                          backgroundImage: FileImage(File(profilePic!)),
                        ),

                        ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: name,
                    validator: (v){
                      if(v!.isEmpty){
                        return "Should not be empty";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "enter a name",
                        border: OutlineInputBorder()
                    ),
                    ),
                  ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: name,
                    validator: (v){
                      if(v!.isEmpty){
                        return "Should not be empty";
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "enter a phone number",
                      border: OutlineInputBorder()
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: name,
                    validator: (v){
                      if(v!.isEmpty){
                        return "Should not be empty";
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "enter an email",

                        border: OutlineInputBorder()
                    ),
                    ),
                  ),
                SizedBox(height: 170,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>editprofile()));
                    },
                    child: Container(
                      height: 50.h,
                      width: 340.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10).w,
                        color: green.withOpacity(0.5),
                      ),
                      child: Center(
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(fontSize: 14.sp, color: textBlack,fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
