import 'package:ev_project/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Bottom_Nav_Bar/bottom_nav_bar.dart';
import '../../constants/Booked_Ev_Card.dart';

class charging_station_detail extends StatefulWidget {
  const charging_station_detail({Key? key}) : super(key: key);

  @override
  State<charging_station_detail> createState() => _charging_station_detailState();
}

class _charging_station_detailState extends State<charging_station_detail>  with SingleTickerProviderStateMixin {
  late  TabController _tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenAspectRatio = MediaQuery.of(context).size.aspectRatio;
    return SafeArea(
        child: Scaffold(
          body: Container(
            width: screenWidth*1,
            height: screenHeight*1,
            child: Stack(
              children: [
                Container(
                  width: screenWidth*1,
                  height: screenHeight*0.4,
                  decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('https://media.istockphoto.com/id/1183367421/photo/electric-car-charging-station-on-london-street.jpg?s=612x612&w=0&k=20&c=zije1SF8OlsyselAYFMxeb80ZYd5fFhBsH0REomFQc4='),
                      fit: BoxFit.cover,)),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Bottom_Nav_Bar()));
                  },
                    child: Image.asset('assets/icons/back-arrow.png',width: screenWidth*0.1)),
                Positioned(
                  top: screenAspectRatio*400,
                  child: Stack(
                    children: [
                      Container(
                        width: screenWidth*1,
                        height: screenHeight*0.7,
                        child: Padding(
                          padding: EdgeInsets.only(left: screenAspectRatio*50,right: screenAspectRatio*50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: screenHeight*0.02),
                              Container(
                                width: screenWidth*0.6,
                                  child: Text('ChargePoint Charging Station',style: TextStyle(fontSize: screenAspectRatio*40,fontWeight: FontWeight.w700,),overflow: TextOverflow.ellipsis,maxLines: 2,)),
                              SizedBox(height: screenHeight*0.02),
                              Row(
                                children: [
                                  Text('3.0'),
                                ],
                              ),
                              SizedBox(height: screenHeight*0.02),
                              Text('OPEN 24 Hours'),
                              SizedBox(height: screenHeight*0.02),
                              Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(screenAspectRatio*25)),
                                // elevation: 7,
                                child: Container(
                                  width: screenWidth*1,
                                  height: screenHeight*0.06,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(screenAspectRatio*25),
                                    color: Colors.black.withOpacity(0.1),
                                  ),

                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal:screenAspectRatio*12,vertical: screenAspectRatio*12),
                                    child: TabBar(
                                      unselectedLabelColor: black,
                                      controller: _tabController,
                                      isScrollable: true,
                                      labelPadding: EdgeInsets.symmetric(horizontal: screenAspectRatio*60),
                                      indicator: BoxDecoration(
                                        borderRadius: BorderRadius.circular(screenAspectRatio*25),
                                        color: green.withOpacity(0.5),
                                      ),

                                      tabs: [
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
                                        Text('data'),
                                      ],
                                    ),
                                  ],),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topRight: Radius.circular(screenAspectRatio*80),topLeft: Radius.circular(screenAspectRatio*80))),
                      ),
                      Positioned(
                        left: screenAspectRatio*485,
                        child: Container(
                          width: screenWidth*0.4,
                          height: screenHeight*0.06,
                          child: Center(child: Text('Open',style: TextStyle(color: textWhite,fontWeight: FontWeight.w500,fontSize: screenAspectRatio*30),),),
                          decoration: BoxDecoration(color: green,borderRadius: BorderRadius.only(topLeft: Radius.circular(screenAspectRatio*0),topRight: Radius.circular(screenAspectRatio*80),bottomLeft: Radius.circular(screenAspectRatio*60))),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
    );
  }
}
