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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(left: screenWidth*0.03,),
            child: Row(
              children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_Nav_Bar()));
              },
                child: Image(image: AssetImage('assets/icons/back-arrow.png'),color: black,
                  width: screenWidth*0.08,height: screenHeight*0.08,)),
                SizedBox(width: screenWidth*0.02),
                Text(
                  'Setting',
                  style: TextStyle(fontSize: screenWidth*0.065, fontWeight: FontWeight.bold),
                ),
           ]
          ),
          ),
          SizedBox(height:screenHeight*0.02),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:  screenWidth*0.024),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>description(Text: 'Terms & Conditions',)));
              },
              child: Card(
                // elevation: 7,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).w),
                child: ListTile(
                  title: Text('Terms & Conditions',style: TextStyle(fontSize: screenWidth*0.044,fontWeight: FontWeight.w500),),
                  trailing:Image(image: AssetImage('assets/icons/right-arrow.png'),  width: screenWidth*0.08,height: screenHeight*0.08,),
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight*0.01),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.024),
            child: InkWell(

              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>description(Text: 'Privacy Policy',)));

              },
              child: Card(
                // elevation: 7,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).w),
                child: ListTile(
                  title: Text('Privacy Policy',style: TextStyle(fontSize: screenWidth*0.044,fontWeight: FontWeight.w500),),
                  trailing:Image(image: AssetImage('assets/icons/right-arrow.png'),  width: screenWidth*0.08,height: screenHeight*0.08,),
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight*0.01),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.024),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>description(Text: 'About Us',)));
              },
              child: Card(
                // elevation: 7,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).w),
                child: ListTile(
                  title: Text('About Us',style: TextStyle(fontSize:screenWidth*0.044,fontWeight: FontWeight.w500),),
                  trailing:Image(image: AssetImage('assets/icons/right-arrow.png'),  width: screenWidth*0.08,height: screenHeight*0.08,),
                ),
              ),
            ),
          ),


        ],
      ),

    ));
  }
}
