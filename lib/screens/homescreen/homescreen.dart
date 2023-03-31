

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev_project/constants/constants.dart';
import 'package:ev_project/screens/Login_Screen/Log_in.dart';
import 'package:ev_project/screens/homescreen/charging_station_detail.dart';
import 'package:ev_project/screens/homescreen/near_by_station.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../components/SearchBar.dart';
import '../../constants/Booked_Ev_Card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dbRef = FirebaseDatabase.instance.ref().child('0');

  // List images = [
  //   'assets/images/download (2).jpg',
  //   'assets/images/1200x-1.jpg',
  //   'assets/images/images (1).jpg',
  //   'assets/images/images (2).jpg',
  // ];

  List cars = [
    'assets/images/large-removebg-preview.png',
    'assets/images/large_8-removebg-preview.png',
    'assets/images/large__3_-removebg-preview.png',
    'assets/images/large__4_-removebg-preview.png'
  ];

  Future apcall()async {
    final dbRef = await FirebaseFirestore.instance.collection('users');
    dbRef.doc(FirebaseAuth.instance.currentUser!.uid).get().
    then((DocumentSnapshot<Map<String, dynamic>>snapshot) {
      String profilePic = snapshot['profilePic'].toString();
      lists(profilePic);
    });
  }

    void lists(main){
      setState(() {
        currentImage = main;
      });
    }

    String? currentImage;

    @override
    void initState() {
      apcall();
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
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
                  borderRadius: const BorderRadius.only(
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
                                  fontSize: screenWidth*0.06, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Near by you',
                              style: TextStyle(
                                  fontSize: screenWidth*0.06, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        currentImage == null ?
                        Padding(
                          padding: EdgeInsets.all(screenWidth*0.03),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: green.withOpacity(0.5),
                            child: Image.asset("assets/images/add-photo.png",
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ) :
                        currentImage.toString().contains('http') ?
                        Padding(
                          padding: EdgeInsets.all(screenWidth*0.03),
                          child: CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(currentImage.toString())
                          ),
                        )
                            : const CircleAvatar(
                          radius: 40,
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight*0.01,),
                    const SearchBar(),
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
                      height: screenHeight*0.01,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: screenWidth*0.06, right: screenWidth*0.06),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'My Booking',
                            style: TextStyle(
                                fontSize: screenWidth*0.053, fontWeight: FontWeight.w500),
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => demo(),));
                            },
                            child: Text('See All',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: screenWidth*0.045)),
                          )
                        ],
                      ),
                    ),
                    Container(
                        width: screenWidth*1,
                        height: screenHeight*0.26,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(left: screenWidth*0.04),
                              child: Container(
                                width: screenWidth*0.7,
                                child: Card(
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
                                                    left: screenWidth*0.04, top: screenWidth*0.04),
                                            child: Container(
                                              width: screenWidth*0.5,
                                              height: screenHeight*0.11,
                                              decoration: BoxDecoration(
                                                  color: green.withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(10)),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                        top: screenWidth*0.025, left: screenWidth*0.025),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: screenWidth*0.2,
                                                      child: Text(
                                                        'OLA Electronic Scooter',
                                                        maxLines: 3,
                                                        style: TextStyle(
                                                            fontSize: screenWidth*0.043,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: screenHeight*0.014),
                                          Padding(
                                            padding:
                                                 EdgeInsets.only(left: screenWidth*0.04),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  size: screenWidth*0.04,
                                                  color: green.withOpacity(0.5),
                                                ),
                                                Container(
                                                  width: screenWidth*0.56,
                                                  child: Text(
                                                    '4750 Arbutus #312, Vancouver',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: screenWidth*0.033),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: screenHeight*0.014,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                    left: screenWidth*0.04, right: screenWidth*0.04),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.bolt,
                                                      size: screenWidth*0.04,
                                                      color: green.withOpacity(0.5),
                                                    ),
                                                    Text(
                                                      'Type 2',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: screenWidth*0.033),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .battery_charging_full,
                                                      size: screenWidth*0.04,
                                                      color: green
                                                          .withOpacity(0.5),
                                                    ),
                                                    Text(
                                                      'Type 2',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: screenWidth*0.033),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.charging_station,
                                                      size: screenWidth*0.04,
                                                      color: green
                                                          .withOpacity(0.5),
                                                    ),
                                                    Text(
                                                      'Type 2',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: screenWidth*0.033),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: screenHeight*0.014,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: screenWidth*0.04),
                                            child: Text(
                                              '50 Min Remaining',
                                              style: TextStyle(fontSize: screenWidth*0.033),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                          left: screenWidth*0.26,
                                          bottom: screenHeight*0.08,
                                          child: Image(
                                            image: AssetImage(
                                                cars[index]),
                                            width: screenWidth*0.45,
                                            height: screenHeight*0.18,
                                          )
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth*0.06, right: screenWidth*0.06),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Near by me',
                            style: TextStyle(
                                fontSize: screenWidth*0.053, fontWeight: FontWeight.w500),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => near_by_station(),));
                            },
                            child: Text('See All',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: screenWidth*0.045)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: screenWidth*1,
                      height: screenHeight * 0.27,
                      child: FirebaseAnimatedList(
                          query: dbRef,
                          itemBuilder: (context, snapshot, animation, index) {
                            List Main = snapshot.value as List;
                            return Container(
                              width: screenWidth*1,
                              height: screenHeight * 0.27,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:  EdgeInsets.only(left: screenWidth*0.04),
                                    child: InkWell(
                                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => charging_station_detail(id: Main[index]["id"]),)),
                                      child: Container(
                                        width: screenWidth*0.8,
                                        child: Card(
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
                                                        left: screenWidth*0.03, top: screenHeight*0.02),
                                                    child: Container(
                                                      width: screenWidth*0.23,
                                                      height: screenHeight*0.1,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  Main[index]['photos'][0]['src'].toString()),
                                                              fit: BoxFit.cover),
                                                          borderRadius:
                                                          BorderRadius.circular(15)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: screenHeight*0.02, left: screenWidth*0.03),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          width: screenWidth*0.45,
                                                          child: Text(
                                                            Main[index]['name'].toString(),
                                                            overflow: TextOverflow.ellipsis,
                                                            maxLines: 2,
                                                            style: TextStyle(
                                                                fontSize: screenWidth*0.043,
                                                                fontWeight:
                                                                FontWeight.w700),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: screenHeight*0.014,
                                                        ),
                                                        Row(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.start,
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
                                                              width: screenWidth*0.4,
                                                              child: Text(
                                                                Main[index]['address'].toString(),
                                                                style: TextStyle(
                                                                    fontSize: screenWidth*0.033),
                                                                overflow:
                                                                TextOverflow.ellipsis,
                                                                maxLines: 2,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: screenHeight*0.014,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                          children: [
                                                            Icon(
                                                              Icons.currency_rupee_outlined,
                                                              size: screenWidth*0.04,
                                                              color:
                                                              green.withOpacity(0.5),
                                                            ),
                                                            SizedBox(
                                                              width:screenWidth*0.014,
                                                            ),
                                                            Text(
                                                              Main[index]['cost'].toString(),
                                                              style: TextStyle(
                                                                  fontSize: screenWidth*0.033),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: screenHeight*0.014,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          children: [
                                                            Icon(
                                                              Icons.star,
                                                              size: screenWidth*0.04,
                                                              color:
                                                              green.withOpacity(0.5),
                                                            ),
                                                            SizedBox(
                                                              width: screenWidth*0.014,
                                                            ),
                                                            Text(
                                                              Main[index]['rating'].toString(),
                                                              style: TextStyle(
                                                                  fontSize: screenWidth*0.033),
                                                            ),
                                                            SizedBox(
                                                              width: screenWidth*0.07,
                                                            ),
                                                            Icon(
                                                              Icons.bolt,
                                                              size: screenWidth*0.04,
                                                              color:
                                                              green.withOpacity(0.5),
                                                            ),
                                                            SizedBox(
                                                              width: screenWidth*0.014,
                                                            ),
                                                            Text(
                                                              Main[index]['connection'][0]['power_kw'].toString(),
                                                              style: TextStyle(
                                                                  fontSize: screenWidth*0.033),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              InkWell(
                                                onTap: () => print("hello"),
                                                child: Padding(
                                                  padding: EdgeInsets.only(top: screenHeight*0.015,left: screenWidth*0.03,right: screenWidth*0.03),
                                                  child: Container(
                                                    width: screenWidth*1,
                                                    height: screenHeight*0.046,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(10),
                                                        border: Border.all(
                                                            width: screenWidth*0.006,
                                                            color: green.withOpacity(0.5))),
                                                    child: Center(
                                                      child: Text(
                                                        'Book Slot',
                                                        style: TextStyle(
                                                            fontSize:screenWidth*0.043,
                                                            fontWeight: FontWeight.bold,
                                                            color: green.withOpacity(0.5)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
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
