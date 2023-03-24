import 'package:ev_project/Bottom_Nav_Bar/bottom_nav_bar.dart';
import 'package:ev_project/components/settings/description.dart';
import 'package:ev_project/screens/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/constants.dart';




class Setting extends StatefulWidget {

    Setting({Key? key, }) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 9,top: 10).r,
            child: Row(
              children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_Nav_Bar()));
              },
                child: Image(image: AssetImage('assets/icons/back-arrow.png'),color: black,width: 30.w,height: 30.h,)),
                SizedBox(width: 7,),
                Text(
                  'Setting',
                  style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                ),
           ]
          ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8).r,
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>description(Text: 'Terms & Conditions',)));
              },
              child: Card(
                // elevation: 7,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).w),
                child: ListTile(
                  title: Text('Terms & Conditions',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
                  trailing:Image(image: AssetImage('assets/icons/right-arrow.png'),width: 30.w,height: 30.h,),
                ),
              ),
            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8).r,
            child: InkWell(

              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>description(Text: 'Privacy Policy',)));

              },
              child: Card(
                // elevation: 7,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).w),
                child: ListTile(
                  title: Text('Privacy Policy',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
                  trailing:Image(image: AssetImage('assets/icons/right-arrow.png'),width: 30.w,height: 30.h,),
                ),
              ),
            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8).r,
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>description(Text: 'About Us',)));
              },
              child: Card(
                // elevation: 7,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).w),
                child: ListTile(
                  title: Text('About Us',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w500),),
                  trailing:Image(image: AssetImage('assets/icons/right-arrow.png'),width: 30.w,height: 30.h,),
                ),
              ),
            ),
          ),


        ],
      ),

    ));
  }
}
