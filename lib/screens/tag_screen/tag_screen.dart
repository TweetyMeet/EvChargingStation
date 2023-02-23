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
        backgroundColor: Colors.grey,
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
                         shape: RoundedRectangleBorder(
                           side: BorderSide(
                             color: Colors.greenAccent,
                           ),
                           borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                         ),
                         margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                         child: Text(''),

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
                             shape: RoundedRectangleBorder(
                               side: BorderSide(
                                 color: Colors.greenAccent,
                               ),
                               borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                             ),
                             margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                             child: Text(''),

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
                             shape: RoundedRectangleBorder(
                               side: BorderSide(
                                 color: Colors.greenAccent,
                               ),
                               borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                             ),
                             margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                             child: Text(''),

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

