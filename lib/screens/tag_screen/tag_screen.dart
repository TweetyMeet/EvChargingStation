import 'package:ev_project/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/SearchBar.dart';
import '../../constants/Booked_Ev_Card.dart';

class TagScreen extends StatefulWidget {
  const TagScreen({Key? key}) : super(key: key);

  @override
  State<TagScreen> createState() => _TagScreenState();
}

class _TagScreenState extends State<TagScreen> with SingleTickerProviderStateMixin {
  late final  TabController _tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

       body: Padding(
         padding:  EdgeInsets.all(screenWidth*0.029),
         child :Column(
             children: [


               Card(
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                 // elevation: 7,
                 child: Container(
                   width: screenWidth*0.95,
                 height: screenHeight*0.07,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(12),
                   color: Colors.black.withOpacity(0.1),
                 ),

                 child: Padding(
                   padding:  EdgeInsets.symmetric(horizontal:screenWidth*0.037,vertical:screenWidth*0.02),
                   child: TabBar(
                     unselectedLabelColor: black,
                     controller: _tabController,
                     isScrollable: true,
                   labelPadding: EdgeInsets.symmetric(horizontal:screenWidth*0.08),
                     indicator: BoxDecoration(
                       borderRadius: BorderRadius.circular(12),
                       color: green.withOpacity(0.5),
                     ),

                     tabs: const [
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
                   physics: const BouncingScrollPhysics(),
                   itemCount: 10,
                   itemBuilder: (context,index){
                     return Container(
                       height: screenHeight*0.3,
                       width: screenWidth*0.6,
                       child: booked_ev_card(number_for_car_images: index),
                     );
                   },
                 ),
                     ListView.builder(
                       physics: const BouncingScrollPhysics(),
                       itemCount: 10,
                       itemBuilder: (context,index){
                         return Container(
                           height: screenHeight*0.3,
                           width: screenWidth*0.6,

                           child: booked_ev_card(number_for_car_images: index),
                         );
                       },
                     ),
                     ListView.builder(
                       physics: const BouncingScrollPhysics(),
                       itemCount: 10,
                       itemBuilder: (context,index){
                         return Container(
                           height: screenHeight*0.3,
                           width: screenWidth*0.6,
                           child: booked_ev_card(number_for_car_images: index),
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

