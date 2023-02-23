import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
         padding: const EdgeInsets.all(8.0),
         child :Column(
             children: [

             Row(
               children :[
               SizedBox(width: 16,),
               Icon(Icons.arrow_back_ios_outlined),
               SizedBox(width: 16,),
               Text('My  Booking',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
             ],
             ),
               Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: TextFormField(

                   decoration: InputDecoration(
                     prefixIcon: Icon(Icons.search),
                     hintText: "Search",

                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20)
                     )
                   ),
                 ),
               ),
               SizedBox(height: 4,),
               Card(
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                 elevation: 5,
                 child: Container(

                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(12),
                   color: Colors.black.withOpacity(0.1),
                 ),

                 child: TabBar(
                   controller: _tabController,
                   isScrollable: true,
                   labelPadding: EdgeInsets.symmetric(horizontal: 35),
                   indicator: BoxDecoration(
                     borderRadius: BorderRadius.circular(12),
                     color: Colors.black
                   ),

                   tabs: [
                     Tab(text: "Ongoing",),
                     Tab(text: "Booked",),
                     Tab(text: "History",),

                   ],
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
                       height: 250,
                       width: 250,
                       child: Card(
                         elevation: 7,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                         ),
                         margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                         child:  Stack(
                           children: [
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.all(15.0),
                                   child: Container(
                                     width: 250,
                                     height: 120,
                                     decoration: BoxDecoration(
                                         color: Color(0xffCCE1F4),
                                         borderRadius: BorderRadius.circular(10)),
                                     child: Padding(
                                       padding: const EdgeInsets.only(top: 10, left: 10),
                                       child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Text(
                                             'OLA',
                                             style: TextStyle(
                                                 fontSize: 22,
                                                 fontWeight: FontWeight.w600),
                                           ),
                                           Text(
                                             'Electronic',
                                             style: TextStyle(
                                                 fontSize: 22,
                                                 fontWeight: FontWeight.w600),
                                           ),
                                           Text(
                                             'Scooter',
                                             style: TextStyle(
                                                 fontSize: 22,
                                                 fontWeight: FontWeight.w600),
                                           ),
                                         ],
                                       ),
                                     ),
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 20),
                                   child: Row(
                                     children: [
                                       Icon(
                                         Icons.location_on,
                                         color: Color(0xffCCE1F4),
                                       ),
                                       Text(
                                         '4750 Arbutus #312, Vancouver',
                                         style: TextStyle(fontSize: 15),
                                       ),
                                     ],
                                   ),
                                 ),
                                 SizedBox(
                                   height: 5,
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 20),
                                   child: Row(
                                     children: [
                                       Icon(
                                         Icons.bolt,
                                         color: Color(0xffCCE1F4),
                                       ),
                                       Text(
                                         'Type 2',
                                         style: TextStyle(fontSize: 18, color: Colors.grey),
                                       ),
                                     ],
                                   ),
                                 ),
                               ],
                             ),
                             Positioned(
                                 left: 130,
                                 child: Image(image: AssetImage('assets/images/bike_image-removebg-preview.png'))),
                           ],
                         ),

                       ),
                     );
                   },
                 ),
                     ListView.builder(
                       physics: BouncingScrollPhysics(),
                       itemCount: 10,
                       itemBuilder: (context,index){
                         return Container(
                           height: 250,
                           width: 250,

                           child: Card(
                             elevation: 7,
                             shape: RoundedRectangleBorder(

                               borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                             ),
                             margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                             child:  Stack(
                               children: [
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.all(15.0),
                                       child: Container(
                                         width: 250,
                                         height: 120,
                                         decoration: BoxDecoration(
                                             color: Color(0xffCCE1F4),
                                             borderRadius: BorderRadius.circular(10)),
                                         child: Padding(
                                           padding: const EdgeInsets.only(top: 10, left: 10),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Text(
                                                 'OLA',
                                                 style: TextStyle(
                                                     fontSize: 22,
                                                     fontWeight: FontWeight.w600),
                                               ),
                                               Text(
                                                 'Electronic',
                                                 style: TextStyle(
                                                     fontSize: 22,
                                                     fontWeight: FontWeight.w600),
                                               ),
                                               Text(
                                                 'Scooter',
                                                 style: TextStyle(
                                                     fontSize: 22,
                                                     fontWeight: FontWeight.w600),
                                               ),
                                             ],
                                           ),
                                         ),
                                       ),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 20),
                                       child: Row(
                                         children: [
                                           Icon(
                                             Icons.location_on,
                                             color: Color(0xffCCE1F4),
                                           ),
                                           Text(
                                             '4750 Arbutus #312, Vancouver',
                                             style: TextStyle(fontSize: 15),
                                           ),
                                         ],
                                       ),
                                     ),
                                     SizedBox(
                                       height: 5,
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 20),
                                       child: Row(
                                         children: [
                                           Icon(
                                             Icons.bolt,
                                             color: Color(0xffCCE1F4),
                                           ),
                                           Text(
                                             'Type 2',
                                             style: TextStyle(fontSize: 18, color: Colors.grey),
                                           ),
                                         ],
                                       ),
                                     ),
                                   ],
                                 ),
                                 Positioned(
                                     left: 130,
                                     child: Image(image: AssetImage('assets/images/bike_image-removebg-preview.png'))),
                               ],
                             ),

                           ),
                         );
                       },
                     ),
                     ListView.builder(
                       physics: BouncingScrollPhysics(),
                       itemCount: 10,
                       itemBuilder: (context,index){
                         return Container(
                           height: 250,
                           width: 250,
                           child: Card(
                             elevation: 7,
                             shape: RoundedRectangleBorder(

                               borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                             ),
                             margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                             child:  Stack(
                               children: [
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.all(15.0),
                                       child: Container(
                                         width: 250,
                                         height: 120,
                                         decoration: BoxDecoration(
                                             color: Color(0xffCCE1F4),
                                             borderRadius: BorderRadius.circular(10)),
                                         child: Padding(
                                           padding: const EdgeInsets.only(top: 10, left: 10),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Text(
                                                 'OLA',
                                                 style: TextStyle(
                                                     fontSize: 22,
                                                     fontWeight: FontWeight.w600),
                                               ),
                                               Text(
                                                 'Electronic',
                                                 style: TextStyle(
                                                     fontSize: 22,
                                                     fontWeight: FontWeight.w600),
                                               ),
                                               Text(
                                                 'Scooter',
                                                 style: TextStyle(
                                                     fontSize: 22,
                                                     fontWeight: FontWeight.w600),
                                               ),
                                             ],
                                           ),
                                         ),
                                       ),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 20),
                                       child: Row(
                                         children: [
                                           Icon(
                                             Icons.location_on,
                                             color: Color(0xffCCE1F4),
                                           ),
                                           Text(
                                             '4750 Arbutus #312, Vancouver',
                                             style: TextStyle(fontSize: 15),
                                           ),
                                         ],
                                       ),
                                     ),
                                     SizedBox(
                                       height: 5,
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.only(left: 20),
                                       child: Row(
                                         children: [
                                           Icon(
                                             Icons.bolt,
                                             color: Color(0xffCCE1F4),
                                           ),
                                           Text(
                                             'Type 2',
                                             style: TextStyle(fontSize: 18, color: Colors.grey),
                                           ),
                                         ],
                                       ),
                                     ),
                                   ],
                                 ),
                                 Positioned(
                                     left: 130,
                                     child: Image(image: AssetImage('assets/images/bike_image-removebg-preview.png'))),
                               ],
                             ),

                           ),
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

