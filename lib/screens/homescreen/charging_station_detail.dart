import 'package:ev_project/constants/constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Bottom_Nav_Bar/bottom_nav_bar.dart';
import '../../constants/Booked_Ev_Card.dart';

class charging_station_detail extends StatefulWidget {
  final id;
  const charging_station_detail({Key? key,required this.id}) : super(key: key);

  @override
  State<charging_station_detail> createState() => _charging_station_detailState();
}

class _charging_station_detailState extends State<charging_station_detail>  with SingleTickerProviderStateMixin {
  late  TabController _tabController = TabController(length: 3, vsync: this);

  final dbRef = FirebaseDatabase.instance.ref().child('0');

  var slot;
  // Map<String, dynamic> data={};
  //
  // Future acall() async {
  //   final dbRef = await FirebaseDatabase.instance.ref().child('0').child('chargingStations').child('slots').child('0');
  //   dbRef.get().then((DataSnapshot snapshot){
  //     Map Main = snapshot.value as Map;
  //     List Main2 = Main["chargingStations"];
  //   });
  // }
  // Future acall() async {
  //   final dbRef = await FirebaseDatabase.instance.ref().child('0').child('chargingStations').child('slots').child('0');
  //   dbRef.update(data)
  // }
  // @override
  // void initState(){
  //   acall();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
          body:Container(
            width: screenWidth*1,
            height: screenHeight*1,
            child: FirebaseAnimatedList(
                query: dbRef,
                itemBuilder: (context, snapshot, animation, index) {
                  List Main = snapshot.value as List;
                  return
                    Container(
                      width: screenWidth*1,
                      height: screenHeight*1,
                      child: ListView.builder(
                        itemCount: Main.length,
                        itemBuilder: (context, index1) {
                          return widget.id.toString() == Main[index1]["id"].toString() ?
                            Container(
                            width: screenWidth*1,
                            height: screenHeight*1,
                            child: Stack(
                              children: [
                                Container(
                                  width: screenWidth*1,
                                  height: screenHeight*0.3,
                                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage(Main[index1]['photos'][0]['src'].toString()),
                                    fit: BoxFit.fill,)),
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Bottom_Nav_Bar()));
                                    },
                                    child: Image.asset('assets/icons/back-arrow.png',color: Colors.white,width: screenWidth*0.1)),
                                Positioned(
                                  top: screenHeight*0.2,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: screenWidth*1,
                                        height: screenHeight*1,
                                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topRight: Radius.circular(screenWidth*0.08),topLeft: Radius.circular(screenWidth*0.08))),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: screenWidth*0.06,right: screenWidth*0.06),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: screenHeight*0.02),
                                              Container(
                                                  width: screenWidth*0.6,
                                                  child: Text('ChargePoint Charging Station',style: TextStyle(fontSize: screenWidth*0.05,fontWeight: FontWeight.w700,),overflow: TextOverflow.ellipsis,maxLines: 2,)),
                                              SizedBox(height: screenHeight*0.02),
                                              Row(
                                                children: const [
                                                  Text('3.0'),
                                                ],
                                              ),
                                              SizedBox(height: screenHeight*0.02),
                                              const Text('OPEN 24 Hours'),
                                              SizedBox(height: screenHeight*0.02),
                                              Card(
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(screenWidth*0.04)),
                                                // elevation: 7,
                                                child: Container(
                                                  width: screenWidth*1,
                                                  height: screenHeight*0.06,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(screenWidth*0.04),
                                                    color: Colors.black.withOpacity(0.1),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: screenWidth*0.02,vertical: screenHeight*0.008),
                                                    child: TabBar(
                                                      unselectedLabelColor: black,
                                                      controller: _tabController,
                                                      isScrollable: true,
                                                      labelPadding: EdgeInsets.symmetric(horizontal: screenWidth*0.08),
                                                      indicator: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(screenWidth*0.03),
                                                        color: green.withOpacity(0.5),
                                                      ),

                                                      tabs: const [
                                                        Tab(text: "Detail",),
                                                        Tab(text: "Reviews",),
                                                        Tab(text: "Photos",),

                                                      ],
                                                    ),
                                                  ) ,),
                                              ),
                                              Expanded(
                                                child: TabBarView(
                                                  controller: _tabController,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        SizedBox(height: screenHeight*0.02),
                                                        const Text('ADDRESS',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600),),
                                                        SizedBox(height: screenHeight*0.01),
                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Icon(
                                                              Icons.location_on,
                                                              size: screenWidth*0.04,
                                                              color:
                                                              green.withOpacity(0.5),
                                                            ),
                                                            SizedBox(
                                                              width: screenWidth*0.014,
                                                            ),
                                                            Container(
                                                              width: screenWidth*0.7,
                                                              child: Text(
                                                                Main[index1]['address'].toString(),
                                                                style: const TextStyle(
                                                                  fontWeight: FontWeight.w500,),
                                                                overflow:
                                                                TextOverflow.ellipsis,
                                                                maxLines: 2,
                                                              ),
                                                            ),

                                                          ],
                                                        ),
                                                        SizedBox(height: screenHeight*0.02),
                                                        const Text('PHONE',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600),),
                                                        SizedBox(height: screenHeight*0.01),
                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Icon(
                                                              Icons.call_outlined,
                                                              size: screenWidth*0.04,
                                                              color:
                                                              green.withOpacity(0.5),
                                                            ),
                                                            SizedBox(
                                                              width: screenWidth*0.014,
                                                            ),
                                                            Container(
                                                              width: screenWidth*0.7,
                                                              child: Text(
                                                                Main[index1]['phone'].toString(),
                                                                style: const TextStyle(
                                                                  fontWeight: FontWeight.w500,),
                                                                overflow:
                                                                TextOverflow.ellipsis,
                                                                maxLines: 2,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: screenHeight*0.02),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children:[
                                                               const Text('Connection',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600),),
                                                                SizedBox(height: screenHeight*0.01,
                                                                    width: screenWidth*0.014),
                                                                Container(
                                                                  child: Text(
                                                                    Main[index1]['connection'][0]['total_connection'].toString(),
                                                                    style: const TextStyle(
                                                                      fontWeight: FontWeight.bold,),
                                                                    overflow:
                                                                    TextOverflow.ellipsis,
                                                                    maxLines: 2,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children:[
                                                               const Text('Speed',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600),),
                                                                SizedBox(height: screenHeight*0.01),
                                                                SizedBox(
                                                                  width: screenWidth*0.014,
                                                                ),
                                                                Container(
                                                                  child: Text(
                                                                    Main[index1]['connection'][0]['power_kw'].toString(),
                                                                    style: const TextStyle(
                                                                      fontWeight: FontWeight.bold,),
                                                                    overflow:
                                                                    TextOverflow.ellipsis,
                                                                    maxLines: 2,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children:[
                                                               const Text('Price',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600),),
                                                                SizedBox(height: screenHeight*0.01),
                                                                SizedBox(
                                                                  width: screenWidth*0.014,
                                                                ),
                                                                Container(
                                                                  child: Text(
                                                                    Main[index1]['cost'].toString(),
                                                                    style: const TextStyle(
                                                                      fontWeight: FontWeight.bold,),
                                                                    overflow:
                                                                    TextOverflow.ellipsis,
                                                                    maxLines: 2,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: screenHeight*0.02),
                                                       const Text('PICK AVAIABLE SLOT',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600),),
                                                        SizedBox(height: screenHeight*0.01),
                                                        Container(
                                                          width: screenWidth*1,
                                                          height: screenHeight*0.11,
                                                          child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisSpacing: screenHeight*0.005,mainAxisExtent: screenHeight*0.05,crossAxisSpacing: screenWidth*0.008),
                                                                itemCount: Main[index1]['slots'].length,
                                                                itemBuilder: (context, index2) {
                                                                  return InkWell(
                                                                    onTap: () {
                                                                      setState(() {
                                                                        slot = index2;
                                                                      });
                                                                    },
                                                                    child: Container(
                                                                      width: screenWidth*0.01,
                                                                      height: screenHeight*0.05,
                                                                      decoration: slot == index2 ?BoxDecoration(color: green.withOpacity(0.2),borderRadius: BorderRadius.circular(50),border: Border.all(color: green,width: 2)): BoxDecoration(borderRadius: BorderRadius.circular(50),border: Border.all(color: Colors.grey,width: 2)),
                                                                      child: slot == index2 ?Center(child: Text(Main[index1]['slots'][index2]['slot_time'].toString(),style: TextStyle(color: green,fontWeight: FontWeight.w600),)): Center(child: Text(Main[index1]['slots'][index2]['slot_time'].toString(),style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600),)),
                                                                    ),
                                                                  );
                                                                },
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.all(screenWidth*0.03),
                                                          child: InkWell(
                                                            onTap: (){

                                                            },
                                                            child: Container(
                                                              height: screenHeight*0.074,
                                                              width: screenWidth*0.94,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(10),
                                                                color: green.withOpacity(0.5),
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  'Book Slot',
                                                                  style: TextStyle(fontSize: screenWidth*0.05, color: textBlack,fontWeight: FontWeight.w500),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      width: screenWidth*0.08,
                                                      height: screenHeight*0.1,
                                                      color: Colors.green,
                                                      child: const Center(
                                                        child: Text('Reviews'),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: screenWidth*1,
                                                      height: screenHeight*1,
                                                      child: Padding(
                                                        padding: EdgeInsets.only(top: screenHeight*0.01),
                                                        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: screenHeight*0.005,mainAxisExtent: screenHeight*0.15,crossAxisSpacing: screenWidth*0.01),
                                                          itemCount: Main[index1]['photos'].length,
                                                          itemBuilder: (context, index2) {
                                                            return InkWell(
                                                              onTap: () {
                                                              },
                                                              child: Container(
                                                                width: screenWidth*0.03,
                                                                height: screenHeight*0.06,
                                                                decoration: BoxDecoration(color: green.withOpacity(0.2),image: DecorationImage(image: AssetImage(Main[index1]['photos'][index2]['src'].toString()),fit: BoxFit.cover)),
                                                                // child: Center(child: Text(Main[index1]['photos'][index2]['src'].toString(),style: TextStyle(color: green,fontWeight: FontWeight.w600),))
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: screenWidth*0.7,
                                        child: Container(
                                          width: screenWidth*0.3,
                                          height: screenHeight*0.06,
                                          decoration: BoxDecoration(color: green,borderRadius: BorderRadius.only(topRight: Radius.circular(screenWidth*0.08),bottomLeft: Radius.circular(screenWidth*0.08))),
                                          child: Center(child: Text('Open',style: TextStyle(color: textWhite,fontWeight: FontWeight.w500,fontSize: screenWidth*0.04),),),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          )
                          :
                          const SizedBox();
                        },
                  ),
                    );
                },
            ),
          ),

        ),
    );
  }
}
