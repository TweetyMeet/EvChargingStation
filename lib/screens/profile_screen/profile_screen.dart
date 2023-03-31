//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev_project/components/settings/settingscreen.dart';
import 'package:ev_project/constants/constants.dart';
import 'package:ev_project/screens/Login_Screen/Log_in.dart';
import 'package:ev_project/screens/profile_screen/my_profile.dart';
import 'package:ev_project/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TextEditingController name = TextEditingController();

  final auth = FirebaseAuth.instance;
  

  Future apcall()async{
    final dbRef = await FirebaseFirestore.instance.collection('users');
    dbRef.doc(FirebaseAuth.instance.currentUser!.uid).get().
    then((DocumentSnapshot<Map<String, dynamic>>snapshot) {
      userName = snapshot['name'];
      String profilePic = snapshot['profilePic'].toString();
      lists(userName,profilePic);
    });
  }

  void lists(name,main){
    setState(() {
      userName = name;
      currentImage = main;
    });
  }

  String? currentImage;
  String? userName;

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
        backgroundColor: Colors.white70,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: EdgeInsets.only(left: screenWidth*0.045),
              child: Text(
                'Profile',
                style: TextStyle(fontSize: screenWidth*0.065, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: screenHeight*0.019,
            ),
            Center(
              child: Container(
                child: currentImage == null ? CircleAvatar(
                  radius: 60,
                  backgroundColor: green.withOpacity(0.5),
                  child: Image.asset("assets/images/add-photo.png",
                    height: 50,
                    width: 50,
                  ),
                ) :
                currentImage.toString().contains('http') ?
                CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(currentImage.toString())
                )
                    : null
                ),

              ),
            SizedBox(
              height: screenHeight*0.019,
            ),
            Center(
                child: Text(userName.toString(),
              style: TextStyle(fontSize: screenHeight*0.023, fontWeight: FontWeight.bold),
            )),

            SizedBox(
              height: screenHeight*0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth*0.021),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> MyProfile()));
                },
                child: Card(
                  // elevation: 7,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: Image(image: const AssetImage('assets/icons/account.png'),color: green,
                      width:  screenWidth*0.06,height: screenHeight*0.06,),
                    title: Text('My Profile',style: TextStyle(fontSize:  screenWidth*0.041,fontWeight: FontWeight.w500),),
                    trailing:Image(image: const AssetImage('assets/icons/right-arrow.png'),width: screenWidth*0.08,height: screenHeight*0.08,),
                  ),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.021),
              child: Card(
                // elevation: 7,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: Image(image: const AssetImage('assets/icons/bookmark(2).png'),color: green,
                    width: screenWidth*0.05,height: screenHeight*0.05,),
                  title: Text('Saved Slots',style: TextStyle(fontSize:  screenWidth*0.041,fontWeight: FontWeight.w500),),
                  trailing:Image(image: const AssetImage('assets/icons/right-arrow.png'),width: screenWidth*0.08,height: screenHeight*0.08,),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.021),
              child: Card(
                // elevation: 7,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  leading: Image(image: const AssetImage('assets/icons/bookmark(2).png'),color: green,
                    width: screenWidth*0.05,height: screenHeight*0.05,),
                  title: Text('My Booking',style: TextStyle(fontSize:  screenWidth*0.041,fontWeight: FontWeight.w500),),
                  trailing:Image(image: const AssetImage('assets/icons/right-arrow.png'),width: screenWidth*0.08,height: screenHeight*0.08,),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.021),
              child: Card(
                // elevation: 7,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: ListTile(

                  leading: Image(image: const AssetImage('assets/icons/car.png'),color: green,
                    width: screenWidth*0.055,height: screenHeight*0.055,),
                  title: Text('My Car',style: TextStyle(fontSize:  screenWidth*0.041,fontWeight: FontWeight.w500),),
                  trailing:Image(image: const AssetImage('assets/icons/right-arrow.png'),width: screenWidth*0.08,height: screenHeight*0.08,),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.021),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Setting()));
                },
                child: Card(
                  // elevation: 7,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(

                    leading: Image(image: const AssetImage('assets/icons/settings.png'),color: green,
                      width: screenWidth*0.05,height: screenHeight*0.05,),
                    title: Text('Setting',style: TextStyle(fontSize: screenWidth*0.041,fontWeight: FontWeight.w500),),
                    trailing:Image(image: const AssetImage('assets/icons/right-arrow.png'),width: screenWidth*0.08,height: screenHeight*0.08,),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight*0.1,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  auth.signOut().then((value){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LogIN(),));
                  }).onError((error, stackTrace) { Utils().toastMessage(error.toString());});
                },
                child: Container(
                    height: screenHeight*0.078,
                    width: screenWidth*0.94,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: green.withOpacity(0.5),
                    ),

                    child: Center(
                        child: Text(
                          'Log Out',
                          style: TextStyle(fontSize: screenWidth*0.05, color: textBlack,fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
              )),
          ],
        ),
      ),
    );
  }
}
