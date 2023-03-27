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
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: screenWidth * 1,
            height: screenHeight * 1,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.03),
                  child: Row(
                    children: [
                      IconButton(onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Bottom_Nav_Bar(),));
                      }, icon: Image.asset('assets/icons/back-arrow.png')),
                      Text("Near by Stations", style: TextStyle(
                          fontSize: screenWidth * 0.07,
                          fontWeight: FontWeight.bold),),
                    ],
                  ),
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
                                padding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.01,
                                    horizontal: screenWidth * 0.04),
                                child: Container(
                                  width: screenWidth * 0.9,
                                  height: screenHeight * 0.29,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: screenWidth * 0.03,
                                                  top: screenHeight * 0.02),
                                              child: Container(
                                                width: screenWidth * 0.26,
                                                height: screenHeight * 0.13,
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
                                                  top: screenHeight * 0.02,
                                                  left: screenWidth * 0.03),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: screenWidth * 0.5,
                                                    child: Text(
                                                      Main[index]['name']
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: screenWidth *
                                                              0.043,
                                                          fontWeight:
                                                          FontWeight.w700),
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: screenHeight *
                                                        0.014,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        Icons.location_on,
                                                        size: screenWidth *
                                                            0.04,
                                                        color:
                                                        green.withOpacity(0.5),
                                                      ),
                                                      SizedBox(
                                                        width: screenWidth *
                                                            0.014,
                                                      ),
                                                      Container(
                                                        width: screenWidth *
                                                            0.48,
                                                        child: Text(
                                                          Main[index]['address']
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: screenWidth *
                                                                  0.033),
                                                          overflow:
                                                          TextOverflow.ellipsis,
                                                          maxLines: 2,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: screenHeight *
                                                        0.014,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .currency_rupee_outlined,
                                                        size: screenWidth *
                                                            0.04,
                                                        color:
                                                        green.withOpacity(0.5),
                                                      ),
                                                      SizedBox(
                                                        width: screenWidth *
                                                            0.014,
                                                      ),
                                                      Text(
                                                        Main[index]['cost'],
                                                        style: TextStyle(
                                                            fontSize: screenWidth *
                                                                0.033),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: screenHeight *
                                                        0.014,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        size: screenWidth *
                                                            0.04,
                                                        color:
                                                        green.withOpacity(0.5),
                                                      ),
                                                      SizedBox(
                                                        width: screenWidth *
                                                            0.014,
                                                      ),
                                                      Text(
                                                        Main[index]['rating']
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: screenWidth *
                                                                0.033),
                                                      ),
                                                      SizedBox(
                                                        width: screenWidth *
                                                            0.07,
                                                      ),
                                                      Icon(
                                                        Icons.bolt,
                                                        size: screenWidth*0.04,
                                                        color:
                                                        green.withOpacity(0.5),
                                                      ),
                                                      SizedBox(
                                                        width: screenWidth * 0.014,
                                                      ),
                                                      Container(
                                                        width: screenWidth *
                                                            0.2,
                                                        height: screenHeight *
                                                            0.02,
                                                        child: ListView.builder(
                                                          scrollDirection: Axis
                                                              .horizontal,
                                                          itemCount: Main[index]['connection']
                                                              .length,
                                                          itemBuilder: (context,
                                                              index2) {
                                                            return Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                  right: screenWidth*0.02),
                                                              child: Text(
                                                                Main[index]['connection'][index2]['connection_type']
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    fontSize: screenWidth*0.033),
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
                                          padding: EdgeInsets.symmetric(
                                             vertical: screenHeight*0.02,
                                          horizontal: screenWidth*0.04),
                                          child: Container(
                                            width: screenWidth * 1,
                                            height: screenHeight * 0.046,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: screenWidth *
                                                        0.006,
                                                    color: green.withOpacity(
                                                        0.5))),
                                            child: Center(
                                              child: Text(
                                                'Book Slot',
                                                style: TextStyle(
                                                    fontSize: screenWidth*0.043,
                                                    fontWeight: FontWeight.bold,
                                                    color: green.withOpacity(
                                                        0.5)),
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
  }
}