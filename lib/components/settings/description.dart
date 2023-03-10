import 'package:ev_project/components/settings/settingscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/constants.dart';



class description extends StatefulWidget {
  var Text;
  description({Key? key,required this.Text}) : super(key: key);

  @override
  State<description> createState() => _descriptionState();
}

class _descriptionState extends State<description> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 9,top: 10).r,
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Setting()));
                        },
                        child: Image(image: AssetImage('assets/icons/back-arrow.png'),color: black,width: 30.w,height: 30.h,)),
                    SizedBox(width: 7,),
                    Text(
                      widget.Text.toString(),
                      style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                    ),

                  ],
                ),

              ],
            ),
          ),
          SizedBox(height: 10.h,),
          Padding(
            padding: const  EdgeInsets.symmetric(horizontal: 15,vertical: 10).r,
            child: Text('1. Types of Data we collect',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),
          ),
          Padding(
            padding: const  EdgeInsets.symmetric(horizontal: 18,vertical: 10).r,
            child: Container(
              width: 350.w,

              child: Text(maxLines: 5,'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Recusandae modi laboriosam delectus praesentium id quam quae harum expedita nulla quo voluptates voluptatum, quis blanditiis repellat fugit dolores ipsam quia ipsum illo error rerum consequatur omnis aliquid aut. Quaerat sit fugit blanditiis possimus ducimus, quisquam aspernatur vel, molestiae, mollitia officiis autem.'),
            ),
          ),
          SizedBox(height: 15.h,),
          Padding(
            padding: const  EdgeInsets.symmetric(horizontal: 15,vertical: 10).r,
            child: Text('2. Use of your personal data',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),
          ),
          Padding(
            padding: const  EdgeInsets.symmetric(horizontal: 18,vertical: 10).r,
            child: Container(
              width: 350.w,

              child: Text(maxLines: 5,'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Recusandae modi laboriosam delectus praesentium id quam quae harum expedita nulla quo voluptates voluptatum, quis blanditiis repellat fugit dolores ipsam quia ipsum illo error rerum consequatur omnis aliquid aut. Quaerat sit fugit blanditiis possimus ducimus, quisquam aspernatur vel, molestiae, mollitia officiis autem.'),
            ),
          ),
          SizedBox(height: 15.h,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10).r,
            child: Text('3. Disclousure of your personal Data ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
            child: Container(
              width: 350.w,

              child: Text(maxLines: 5,'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Recusandae modi laboriosam delectus praesentium id quam quae harum expedita nulla quo voluptates voluptatum, quis blanditiis repellat fugit dolores ipsam quia ipsum illo error rerum consequatur omnis aliquid aut. Quaerat sit fugit blanditiis possimus ducimus, quisquam aspernatur vel, molestiae, mollitia officiis autem.'),
            ),
          ),
      ],),
    ));
  }
}
