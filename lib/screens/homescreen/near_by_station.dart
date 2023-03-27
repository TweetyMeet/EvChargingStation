import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../Bottom_Nav_Bar/bottom_nav_bar.dart';
import '../../constants/constants.dart';

class near_by_station extends StatefulWidget {
  const near_by_station({Key? key}) : super(key: key);

  @override
  State<near_by_station> createState() => near_by_stationState();
}

class near_by_stationState extends State<near_by_station> {
  Query dbRef = FirebaseDatabase.instance.ref().child('0');

  List images = [
    'assets/images/download (2).jpg',
    'assets/images/1200x-1.jpg',
    'assets/images/images (1).jpg',
    'assets/images/images (2).jpg',
    'assets/images/download (2).jpg',
    'assets/images/1200x-1.jpg',
    'assets/images/images (1).jpg',
    'assets/images/images (2).jpg',
    'assets/images/download (2).jpg',
    'assets/images/1200x-1.jpg',
    'assets/images/images (1).jpg',
    'assets/images/images (2).jpg',
    'assets/images/download (2).jpg',
    'assets/images/1200x-1.jpg',
    'assets/images/images (1).jpg',
    'assets/images/images (2).jpg',
    'assets/images/download (2).jpg',
    'assets/images/1200x-1.jpg',
    'assets/images/images (1).jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: screenWidth * 1,
            height: screenHeight * 1,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Bottom_Nav_Bar(),));
                    }, icon: Image.asset('assets/icons/back-arrow.png')),
                    Text("Near by Stations",style: TextStyle(
                        fontSize: screensize.aspectRatio*45, fontWeight: FontWeight.bold),),
                  ],
                ),
                Container(
                  width: screenWidth * 1,
                  height: screenHeight * 0.9,
                  child: FirebaseAnimatedList(
                    query: dbRef,
                    itemBuilder: (BuildContext context, DataSnapshot snapshot,
                        Animation<double> animation, int index) {
                      List Main = snapshot.value as List;

                      return Container(
                          width: screenWidth * 1,
                          height: screenHeight * 1,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: Main.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:  EdgeInsets.symmetric(vertical: screensize.aspectRatio*10,horizontal: screensize.aspectRatio*20),
                                child: Container(
                                  // color: Colors.red,
                                  width: screensize.width*0.9,
                                  height: screenHeight*0.27,
                                  child: Card(
                                    // elevation: 7,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: screensize.aspectRatio*30, top: screensize.aspectRatio*30),
                                              child: Container(
                                                width: screensize.width*0.26,
                                                height: screensize.height*0.13,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            images[index]),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                    BorderRadius.circular(15)),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: screensize.aspectRatio*30, left: screensize.aspectRatio*30),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: screensize.width*0.5,
                                                    child: Text(
                                                      Main[index]['name'].toString(),
                                                      style: TextStyle(
                                                          fontSize: screensize.aspectRatio*33,
                                                          fontWeight:
                                                          FontWeight.w700),
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: screensize.height*0.014,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        Icons.location_on,
                                                        size: screensize.aspectRatio*33,
                                                        color:
                                                        green.withOpacity(0.5),
                                                      ),
                                                      SizedBox(
                                                        width: screensize.width*0.014,
                                                      ),
                                                      Container(
                                                        width: screensize.width*0.48,
                                                        child: Text(
                                                          Main[index]['address'].toString(),
                                                          style: TextStyle(
                                                              fontSize: screensize.aspectRatio*27),
                                                          overflow:
                                                          TextOverflow.ellipsis,
                                                          maxLines: 2,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: screensize.height*0.014,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        Icons.currency_rupee_outlined,
                                                        size: screensize.aspectRatio*33,
                                                        color:
                                                        green.withOpacity(0.5),
                                                      ),
                                                      SizedBox(
                                                        width:screensize.width*0.014,
                                                      ),
                                                      Text(
                                                        Main[index]['cost'],
                                                        style: TextStyle(
                                                            fontSize: screensize.aspectRatio*27),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: screensize.height*0.014,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        size: screensize.aspectRatio*33,
                                                        color:
                                                        green.withOpacity(0.5),
                                                      ),
                                                      SizedBox(
                                                        width: screensize.width*0.014,
                                                      ),
                                                      Text(
                                                        Main[index]['rating'].toString(),
                                                        style: TextStyle(
                                                            fontSize: screensize.aspectRatio*27),
                                                      ),
                                                      SizedBox(
                                                        width: screensize.width*0.07,
                                                      ),
                                                      Icon(
                                                        Icons.bolt,
                                                        size: screensize.aspectRatio*33,
                                                        color:
                                                        green.withOpacity(0.5),
                                                      ),
                                                      SizedBox(
                                                        width: screensize.width*0.014,
                                                      ),
                                                      Container(
                                                        width: screenWidth*0.2,
                                                        height: screenHeight*0.02,
                                                        child: ListView.builder(
                                                          scrollDirection: Axis.horizontal,
                                                          itemCount: Main[index]['connection'].length,
                                                            itemBuilder: (context, index2) {
                                                              return Padding(
                                                                padding: EdgeInsets.only(right: screensize.aspectRatio*10),
                                                                child: Text(
                                                                  Main[index]['connection'][index2]['connection_type'].toString(),
                                                                  style: TextStyle(
                                                                      fontSize: screensize.aspectRatio*27),
                                                                ),
                                                              );
                                                            },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: screensize.aspectRatio*20,left: screensize.aspectRatio*25,right: screensize.aspectRatio*25,bottom: screensize.aspectRatio*15),
                                          child: Container(
                                            width: screensize.width*1,
                                            height: screensize.height*0.046,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: screensize.width*0.006,
                                                    color: green.withOpacity(0.5))),
                                            child: Center(
                                              child: Text(
                                                'Book Slot',
                                                style: TextStyle(
                                                    fontSize:screensize.aspectRatio*32,
                                                    fontWeight: FontWeight.bold,
                                                    color: green.withOpacity(0.5)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    //   SafeArea(
    //   child: Scaffold(
    //     body: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         IconButton(onPressed: () {
    //           Navigator.of(context).pop();
    //         }, icon: Icon(Icons.arrow_back_ios_new)),
    //         Expanded(
    //           child: FutureBuilder(
    //             future: apicall(),
    //             builder:(context, snapshot) {
    //             return snapshot.hasData
    //                 ? Center(child: CircularProgressIndicator(color: Colors.red,))
    //                 :
    //             ListView.builder(
    //               physics: BouncingScrollPhysics(),
    //               itemCount: listResponse!.length,
    //               itemBuilder: (context,index){
    //                 return Container(
    //                   height: 200,
    //                   width: 400,
    //                   child: Card(
    //                     elevation: 7,
    //                     shape: RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(20),
    //                     ),
    //                     child: Stack(
    //                       children: [
    //                         Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             Padding(
    //                               padding: const EdgeInsets.only(left: 10,top: 10),
    //                               child: Container(
    //                                 width: 220,
    //                                 height: 90,
    //                                 decoration: BoxDecoration(
    //                                     color: green.withOpacity(0.5),
    //                                     borderRadius: BorderRadius.circular(10)),
    //                                 child: Padding(
    //                                   padding: const EdgeInsets.only(top: 10, left: 10),
    //                                   child: Column(
    //                                     crossAxisAlignment: CrossAxisAlignment.start,
    //                                     children: [
    //                                       Container(
    //                                         width: 150,
    //                                         child: Text(
    //                                           'OLA Electronic Scooter',
    //                                           maxLines: 3,
    //                                           style: TextStyle(
    //                                               fontSize: 16,
    //                                               fontWeight: FontWeight.w500),
    //                                         ),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                             SizedBox(height: 15),
    //                             Padding(
    //                               padding: const EdgeInsets.only(left: 10),
    //                               child: Row(
    //                                 children: [
    //                                   Icon(
    //                                     Icons.location_on,size: 15,
    //                                     color: green.withOpacity(0.5),
    //                                   ),
    //                                   Container(
    //                                     width: 180,
    //                                     child: Text(
    //                                       listResponse![index]['street_address'].toString(),overflow: TextOverflow.ellipsis,
    //                                       style: TextStyle(fontSize: 12),
    //                                     ),
    //                                   ),
    //                                 ],
    //                               ),
    //                             ),
    //                             SizedBox(
    //                               height: 10,
    //                             ),
    //                             Padding(
    //                               padding: const EdgeInsets.only(left: 10,right: 20),
    //                               child: Row(
    //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                                 children: [
    //                                   Row(
    //                                     children: [
    //                                       Icon(
    //                                         Icons.bolt,
    //                                         size: 15,
    //                                         color: green.withOpacity(0.5),
    //                                       ),
    //                                       Text(
    //                                         listResponse![index]['ev_pricing'].toString() == 'null' ? '\$3.0 per hour' : listResponse![index]['ev_pricing'].toString(),
    //                                         style: TextStyle(color: Colors.grey,fontSize: 12),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                   Row(
    //                                     children: [
    //                                       Icon(
    //                                         Icons.battery_charging_full,
    //                                         size: 15,
    //                                         color: green.withOpacity(0.5),
    //                                       ),
    //                                       Text(
    //                                         'Type 2',
    //                                         style: TextStyle(color: Colors.grey,fontSize: 12),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                   Row(
    //                                     children: [
    //                                       Icon(
    //                                         Icons.charging_station,
    //                                         size: 15,
    //                                         color: green.withOpacity(0.5),
    //                                       ),
    //                                       Text(
    //                                         'Type 2',
    //                                         style: TextStyle(color: Colors.grey,fontSize: 12),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 ],
    //                               ),
    //                             ),
    //                             // google_map(),
    //                             SizedBox(
    //                               height: 10,
    //                             ),
    //                             Padding(
    //                               padding: const EdgeInsets.only(left: 20),
    //                               child: Text('50 Min Remaining',style: TextStyle(fontSize: 12),),
    //                             ),
    //                           ],
    //                         ),
    //                         Positioned(
    //                             left: 160,
    //                             bottom: 65,
    //                             child: Image(image: AssetImage('assets/images/App_logo-removebg-preview.png'),width: 160,height: 150,)),
    //                       ],
    //                     ),
    //                   ),
    //                 );
    //               },
    //             );
    //           },),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
