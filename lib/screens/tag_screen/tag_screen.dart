import 'package:ev_project/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/SearchBar.dart';
import '../../constants/Booked_Ev_Card.dart';

class TagScreen extends StatefulWidget {
  const TagScreen({Key? key}) : super(key: key);

  @override
  State<TagScreen> createState() => _TagScreenState();
}

class _TagScreenState extends State<TagScreen> with SingleTickerProviderStateMixin {
  late  TabController _tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

       body: Padding(
         padding: const EdgeInsets.all(8.0).w,
         child :Column(
             children: [
         Padding(
         padding: const EdgeInsets.all(0.0).w,
         child: Container(
           height: 40.h,
           child: TextFormField(
             style: TextStyle(color: textBlack),
             cursorColor: black,
             decoration: InputDecoration(
               fillColor: white,
               filled: true,
               prefixIcon: Icon(Icons.search,
                 color: iconBlack,
               ),
               hintText: 'Search',
               hintStyle: TextStyle(color: Colors.grey,fontSize: 13.sp),
               border: OutlineInputBorder(borderRadius: BorderRadius.circular(15).w,
                 borderSide: BorderSide(width: 1,color: black),),
               focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,color: black),borderRadius: BorderRadius.circular(15).w),
               enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15).w,borderSide: BorderSide(width: 1,color: black)),
             ),
           ),
         ),
       ),
               SizedBox(height: 4.h,),
               Card(
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12).w),
                 elevation: 7,
                 child: Container(
                   width: 400,
                 height: 50,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(12).w,
                   color: Colors.black.withOpacity(0.1),
                 ),

                 child: Padding(
                   padding: const EdgeInsets.all(5.0).w,
                   child: TabBar(
                     unselectedLabelColor: black,
                     controller: _tabController,
                     isScrollable: true,
                     labelPadding: EdgeInsets.symmetric(horizontal: 28).w,
                     indicator: BoxDecoration(
                       borderRadius: BorderRadius.circular(12).w,
                       color: green.withOpacity(0.5),
                     ),

                     tabs: [
                       Tab(text: "Ongoing",),
                       Tab(text: "Booked",),
                       Tab(text: "History",),

                     ],
                   ),
                 ) ,),
               ),
               Expanded(
                 child: TabBarView(
                   controller: _tabController,
                   children: [
                 ListView.builder(
                   physics: BouncingScrollPhysics(),
                   itemCount: 10,
                   itemBuilder: (context,index){
                     return Container(
                       height: 200.h,
                       width: 400.w,
                       child: booked_ev_card(),
                     );
                   },
                 ),
                     ListView.builder(
                       physics: BouncingScrollPhysics(),
                       itemCount: 10,
                       itemBuilder: (context,index){
                         return Container(
                           height: 200.h,
                           width: 400.w,

                           child: booked_ev_card(),
                         );
                       },
                     ),
                     ListView.builder(
                       physics: BouncingScrollPhysics(),
                       itemCount: 10,
                       itemBuilder: (context,index){
                         return Container(
                           height: 200.h,
                           width: 400.w,
                           child: booked_ev_card(),
                         );
                       },
                     ),
                 ],),
               ),
           ],),
         ),
       ),

    );
  }
}

