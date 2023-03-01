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
            // Center(
            //   child: Container(
            //     width: 330.w,
            //     height: 50.h,
            //     child: Card(
            //       elevation: 7,
            //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).w),
            //       child: Row(
            //         children: [
            //           SizedBox(width: 10.h,),
            //           Image(image: AssetImage('assets/icons/account.png'),width: 30.w,height: 23.h,),
            //           SizedBox(width: 10.h,),
            //           Text('My Profile',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700),),
            //           SizedBox(width: 150,),
            //           Image(image: AssetImage('assets/icons/right-arrow.png'),),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // Center(
            //   child: Container(
            //     width: 330.w,
            //     height: 50.h,
            //     child: Card(
            //       elevation: 7,
            //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).w),
            //       child: Row(
            //         children: [
            //           SizedBox(width: 10.h,),
            //           Image(image: AssetImage('assets/icons/bookmark(2).png'),width: 30.w,height: 23.h,),
            //           SizedBox(width: 10.h,),
            //           Text('Saved Slots',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700),),
            //           SizedBox(width: 150,),
            //           Image(image: AssetImage('assets/icons/right-arrow.png'),),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // Center(
            //   child: Container(
            //     width: 330.w,
            //     height: 50.h,
            //     child: Card(
            //       elevation: 7,
            //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).w),
            //       child: Row(
            //         children: [
            //           SizedBox(width: 10.h,),
            //           Image(image: AssetImage('assets/icons/bookmark(2).png'),width: 30.w,height: 23.h,),
            //           SizedBox(width: 10.h,),
            //           Text('My Booking',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700),),
            //           SizedBox(width: 150,),
            //           Image(image: AssetImage('assets/icons/right-arrow.png'),),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // Center(
            //   child: Container(
            //     width: 330.w,
            //     height: 50.h,
            //     child: Card(
            //       elevation: 7,
            //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).w),
            //       child: Row(
            //         children: [
            //           SizedBox(width: 10.h,),
            //           Image(image: AssetImage('assets/icons/car.png'),width: 30.w,height: 23.h,),
            //           SizedBox(width: 10.h,),
            //           Text('My Car',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700),),
            //           SizedBox(width: 150,),
            //           Image(image: AssetImage('assets/icons/right-arrow.png'),),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // Center(
            //   child: Container(
            //     width: 330.w,
            //     height: 50.h,
            //     child: Card(
            //       elevation: 7,
            //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).w),
            //       child: Row(
            //         children: [
            //           SizedBox(width: 10.h,),
            //           Image(image: AssetImage('assets/icons/settings.png'),width: 30.w,height: 23.h,),
            //           SizedBox(width: 10.h,),
            //           Text('Setting',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700),),
            //           SizedBox(width: 150,),
            //           Image(image: AssetImage('assets/icons/right-arrow.png'),),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),

            Card(
              elevation: 7,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).w),
              child: ListTile(
                leading: Image(image: AssetImage('assets/icons/account.png'),color: green,width: 30.w,height: 25.h,),
                title: Text('My Profile',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
                trailing:Image(image: AssetImage('assets/icons/right-arrow.png'),width: 40.w,height: 40.h,),
              ),
            ),
            Card(
              elevation: 7,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).w),
              child: ListTile(
                leading: Image(image: AssetImage('assets/icons/bookmark(2).png'),color: green,width: 30.w,height: 25.h,),
                title: Text('Saved Slots',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
                trailing:Image(image: AssetImage('assets/icons/right-arrow.png'),width: 40.w,height: 40.h,),
              ),
            ),
            Card(
              elevation: 7,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).w),
              child: ListTile(
                leading: Image(image: AssetImage('assets/icons/bookmark(2).png'),color: green,width: 30.w,height: 25.h,),
                title: Text('My Booking',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
                trailing:Image(image: AssetImage('assets/icons/right-arrow.png'),width: 40.w,height: 40.h,),
              ),
            ),
            Card(
              elevation: 7,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).w),
              child: ListTile(
                leading: Image(image: AssetImage('assets/icons/car.png'),color: green,width: 30.w,height: 25.h,),
                title: Text('My Car',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
                trailing:Image(image: AssetImage('assets/icons/right-arrow.png'),width: 40.w,height: 40.h,),
              ),
            ),
            Card(
              elevation: 7,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).w),
              child: ListTile(
                leading: Image(image: AssetImage('assets/icons/settings.png'),color: green,width: 30.w,height: 25.h,),
                title: Text('Setting',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
                trailing:Image(image: AssetImage('assets/icons/right-arrow.png'),width: 40.w,height: 40.h,),
              ),
            ),

            // ListTile(
            //   leading: Container(
            //     height: 30.h,
            //     width: 30.w,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(100).w,
            //       color: Colors.tealAccent.withOpacity(0.1),
            //     ),
            //     child: Icon(Icons.save_sharp,color: Colors.black,),
            //   ),
            //   title: Text('Saved Slots',),
            //   trailing: Container(
            //     width: 30.w,
            //     height: 30.h,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(100).w,
            //       color: Colors.grey.withOpacity(0.1),
            //     ),
            //     child: Icon(Icons.arrow_forward_ios_rounded),
            //   ),
            //
            // ),
            // ListTile(
            //   leading: Container(
            //     height: 30.h,
            //     width: 30.w,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(100).w,
            //       color: Colors.tealAccent.withOpacity(0.1),
            //     ),
            //     child: Icon(Icons.bookmark,color: Colors.black,),
            //   ),
            //   title: Text('My Booking',),
            //   trailing: Container(
            //     width: 30.w,
            //     height: 30.h,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(100).w,
            //       color: Colors.grey.withOpacity(0.1),
            //     ),
            //     child: Icon(Icons.arrow_forward_ios_rounded),
            //   ),
            //
            // ),
            // ListTile(
            //   leading: Container(
            //     height: 30.h,
            //     width: 30.w,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(100).w,
            //       color: Colors.tealAccent.withOpacity(0.1),
            //     ),
            //     child: Icon(Icons.car_crash_sharp,color: Colors.black,),
            //   ),
            //   title: Text('My Car',),
            //   trailing: Container(
            //     width: 30.w,
            //     height: 30.h,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(100).w,
            //       color: Colors.grey.withOpacity(0.1),
            //     ),
            //     child: Icon(Icons.arrow_forward_ios_rounded),
            //   ),
            //
            // ),
            // ListTile(
            //   leading: Container(
            //     height: 30.h,
            //     width: 30.w,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(100).w,
            //       color: Colors.tealAccent.withOpacity(0.1),
            //     ),
            //     child: Icon(Icons.settings,color: Colors.black,),
            //   ),
            //   title: Text('Setting',),
            //   trailing: Container(
            //     width: 30.w,
            //     height: 30.h,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(100).w,
            //       color: Colors.grey.withOpacity(0.1),
            //     ),
            //     child: Icon(Icons.arrow_forward_ios_rounded),
            //   ),
            //
            // ),
            SizedBox(
              height: 35.h,
            ),

            Center(
              child: Container(
                  height: 50.h,
                  width: 330.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10).w,
                    color: green.withOpacity(0.5),
                  ),
                  child: OutlinedButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10).w))),
                    onPressed: () {
                      auth.signOut().then((value){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LogIN(),));
                      }).onError((error, stackTrace) { Utils().toastMessage(error.toString());});
                    },
                    child: Text(
                      'Log Out',
                      style: TextStyle(fontSize: 14.sp, color: textBlack),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
