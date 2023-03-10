import 'package:ev_project/components/settings/settingscreen.dart';
import 'package:ev_project/constants/constants.dart';
import 'package:ev_project/screens/Login_Screen/Log_in.dart';
import 'package:ev_project/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  
  final auth = FirebaseAuth.instance;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25,top: 10).r,
              child: Text(
                'Profile',
                style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Center(
              child: CircleAvatar(
                  radius: 50.r,
                  backgroundImage: AssetImage("assets/images/PHOTO.png")),
            ),


            SizedBox(
              height: 10.h,
            ),
            Center(
                child: Text(
              'Meet Pansuriya',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            )),
            Center(
                child: Text(
              'India',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            )),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8).r,
              child: Card(
                // elevation: 7,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).w),
                child: ListTile(
                  leading: Image(image: AssetImage('assets/icons/account.png'),color: green,width: 25.w,height: 20.h,),
                  title: Text('My Profile',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
                  trailing:Image(image: AssetImage('assets/icons/right-arrow.png'),width: 30.w,height: 30.h,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8).r,
              child: Card(
                // elevation: 7,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).w),
                child: ListTile(
                  leading: Image(image: AssetImage('assets/icons/bookmark(2).png'),color: green,width: 20.w,height: 15.h,),
                  title: Text('Saved Slots',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
                  trailing:Image(image: AssetImage('assets/icons/right-arrow.png'),width: 30.w,height: 30.h,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8).r,
              child: Card(
                // elevation: 7,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).w),
                child: ListTile(
                  leading: Image(image: AssetImage('assets/icons/bookmark(2).png'),color: green,width: 20.w,height: 15.h,),
                  title: Text('My Booking',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
                  trailing:Image(image: AssetImage('assets/icons/right-arrow.png'),width: 30.w,height: 30.h,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8).r,
              child: Card(
                // elevation: 7,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).w),
                child: ListTile(
                  leading: Image(image: AssetImage('assets/icons/car.png'),color: green,width: 25.w,height: 20.h,),
                  title: Text('My Car',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
                  trailing:Image(image: AssetImage('assets/icons/right-arrow.png'),width: 30.w,height: 30.h,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8).r,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Setting()));
                },
                child: Card(
                  // elevation: 7,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).w),
                  child: ListTile(
                    leading: Image(image: AssetImage('assets/icons/settings.png'),color: green,width: 23.w,height: 18.h,),
                    title: Text('Setting',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
                    trailing:Image(image: AssetImage('assets/icons/right-arrow.png'),width: 30.w,height: 30.h,),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  auth.signOut().then((value){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LogIN(),));
                  }).onError((error, stackTrace) { Utils().toastMessage(error.toString());});
                },
                child: Container(
                    height: 50.h,
                    width: 330.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10).w,
                      color: green.withOpacity(0.5),
                    ),
                    child: Center(
                        child: Text(
                          'Log Out',
                          style: TextStyle(fontSize: 14.sp, color: textBlack,fontWeight: FontWeight.w500),
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
