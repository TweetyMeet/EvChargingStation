import 'package:ev_project/constants/constants.dart';
import 'package:ev_project/screens/Login_Screen/Log_in.dart';
import 'package:ev_project/screens/homescreen/demo_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/SearchBar.dart';
import '../../constants/Booked_Ev_Card.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List images = [
    'assets/images/download (2).jpg',
    'assets/images/1200x-1.jpg',
    'assets/images/images (1).jpg',
    'assets/images/images (2).jpg',
  ];

  List cars = [
    'assets/images/large-removebg-preview.png',
    'assets/images/large_8-removebg-preview.png',
    'assets/images/large__3_-removebg-preview.png',
    'assets/images/large__4_-removebg-preview.png'
  ];

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              width: screenWidth*1,
              height: screenHeight* 0.215,
              decoration: BoxDecoration(
                  color: green.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.06),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Choose EV Charger",
                              style: TextStyle(
                                  fontSize: screensize.aspectRatio*45, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Near by you',
                              style: TextStyle(
                                  fontSize: screensize.aspectRatio*45, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Container(
                          width:screenWidth*0.29,
                          height: screenHeight*0.13,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/App_logo-removebg-preview.png'))),
                        ),
                      ],
                    ),
                    SearchBar(),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screensize.height*0.006,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: screensize.aspectRatio*40, right: screensize.aspectRatio*40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'My Booking',
                            style: TextStyle(
                                fontSize: screensize.aspectRatio*40, fontWeight: FontWeight.w500),
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => demo(),));
                            },
                            child: Text('See All',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: screensize.aspectRatio*33)),
                          )
                        ],
                      ),
                    ),
                    Container(
                        width: screensize.width*1,
                        height: screensize.height*0.26,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(left: screensize.aspectRatio*35),
                              child: Container(
                                width: screensize.width*0.7,
                                child: Card(
                                  // elevation: 7,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Stack(
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                    left: screensize.aspectRatio*30, top: screensize.aspectRatio*30),
                                            child: Container(
                                              width: screensize.width*0.5,
                                              height: screenHeight*0.11,
                                              decoration: BoxDecoration(
                                                  color: green.withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(10)),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                        top: screensize.aspectRatio*20, left: screensize.aspectRatio*20),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: screensize.width*0.2,
                                                      child: Text(
                                                        'OLA Electronic Scooter',
                                                        maxLines: 3,
                                                        style: TextStyle(
                                                            fontSize: screensize.aspectRatio*35,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    // Text(
                                                    //   'Electronic',
                                                    //   style: TextStyle(
                                                    //       fontSize: 16.sp,
                                                    //       fontWeight: FontWeight.w500),
                                                    // ),
                                                    // Text(
                                                    //   'Scooter',
                                                    //   style: TextStyle(
                                                    //       fontSize: 16.sp,
                                                    //       fontWeight: FontWeight.w500),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: screensize.height*0.014),
                                          Padding(
                                            padding:
                                                 EdgeInsets.only(left: screensize.aspectRatio*25),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  size: screensize.aspectRatio*33,
                                                  color: green.withOpacity(0.5),
                                                ),
                                                Container(
                                                  width: screensize.width*0.56,
                                                  child: Text(
                                                    '4750 Arbutus #312, Vancouver',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: screensize.aspectRatio*27),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: screensize.height*0.014,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                    left: screensize.aspectRatio*25, right: screensize.aspectRatio*35),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.bolt,
                                                      size: screensize.aspectRatio*33,
                                                      color: green.withOpacity(0.5),
                                                    ),
                                                    Text(
                                                      'Type 2',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: screensize.aspectRatio*27),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .battery_charging_full,
                                                      size: screensize.aspectRatio*33,
                                                      color: green
                                                          .withOpacity(0.5),
                                                    ),
                                                    Text(
                                                      'Type 2',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: screensize.aspectRatio*27),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.charging_station,
                                                      size: screensize.aspectRatio*33,
                                                      color: green
                                                          .withOpacity(0.5),
                                                    ),
                                                    Text(
                                                      'Type 2',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: screensize.aspectRatio*27),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: screensize.height*0.014,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: screensize.aspectRatio*30),
                                            child: Text(
                                              '50 Min Remaining',
                                              style: TextStyle(fontSize: screensize.aspectRatio*27),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                          left: screensize.aspectRatio*190,
                                          bottom: screensize.aspectRatio*130,
                                          child: Image(
                                            image: AssetImage(
                                                cars[index]),
                                            width: screensize.width*0.45,
                                            height: screensize.height*0.18,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: screensize.aspectRatio*40, right: screensize.aspectRatio*40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Near by me',
                            style: TextStyle(
                                fontSize: screensize.aspectRatio*40, fontWeight: FontWeight.w500),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => demo(),));
                            },
                            child: Text('See All',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: screensize.aspectRatio*33)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: screensize.width*1,
                      height: screensize.height * 0.26,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:  EdgeInsets.only(left: screensize.aspectRatio*35),
                            child: Container(
                              width: screensize.width*0.8,
                              child: Card(
                                // elevation: 7,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
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
                                            width: screensize.width*0.23,
                                            height: screensize.height*0.1,
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
                                              Text(
                                                'ChargePoint',
                                                style: TextStyle(
                                                    fontSize: screensize.aspectRatio*33,
                                                    fontWeight:
                                                        FontWeight.w700),
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
                                                    width: screensize.width*0.4,
                                                    child: Text(
                                                      '451 Beach Crescent,BC V6Z 3H1',
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
                                                    Icons.directions_walk,
                                                    size: screensize.aspectRatio*33,
                                                    color:
                                                        green.withOpacity(0.5),
                                                  ),
                                                  SizedBox(
                                                    width:screensize.width*0.014,
                                                  ),
                                                  Text(
                                                    '3.5 Km Away/50 Min',
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
                                                    '5.0',
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
                                                  Text(
                                                    '07',
                                                    style: TextStyle(
                                                        fontSize: screensize.aspectRatio*27),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: screensize.aspectRatio*20,left: screensize.aspectRatio*25,right: screensize.aspectRatio*25),
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
