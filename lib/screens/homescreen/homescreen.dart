import 'package:ev_project/constants/constants.dart';
import 'package:ev_project/screens/Login_Screen/Log_in.dart';
import 'package:ev_project/screens/homescreen/demo_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/OwnerEvVehiclesList.dart';
import '../../components/SearchBar.dart';
import '../../constants/Booked_Ev_Card.dart';
import 'near_by_stations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: 400.w,
              height: 155.h,
              decoration: BoxDecoration(
                  color: green.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30).w,
                      bottomRight: Radius.circular(30).w)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0).w,
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
                                  fontSize: 20.sp, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Near by you',
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Container(
                          width: 100.w,
                          height: 100.h,
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
                    // SearchBar(),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 15).r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'My Booking',
                            style:
                                TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('See All',
                                style: TextStyle(
                                    color: Colors.grey.shade600,fontSize: 15.sp)),
                          )
                        ],
                      ),
                    ),
                    Container(
                        width: 400.w,
                        height: 200.h,
                        // decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.circular(20),
                        //     boxShadow: [BoxShadow(color: Colors.grey,spreadRadius: 0,blurRadius: 0)]
                        // ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                           return Padding(
                             padding: const EdgeInsets.only(left: 15).r,
                             child: Container(
                               width: 250.w,
                                 height: 200.h,
                                 child: Card(
                                   elevation: 7,
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(20).w,
                                   ),
                                   child: Stack(
                                     children: [
                                       Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Padding(
                                             padding: const EdgeInsets.only(left: 10,top: 10).r,
                                             child: Container(
                                               width: 180.w,
                                               height: 90.h,
                                               decoration: BoxDecoration(
                                                   color: green.withOpacity(0.5),
                                                   borderRadius: BorderRadius.circular(10).w),
                                               child: Padding(
                                                 padding: const EdgeInsets.only(top: 10, left: 10).r,
                                                 child: Column(
                                                   crossAxisAlignment: CrossAxisAlignment.start,
                                                   children: [
                                                     Container(
                                                       width: 100.w,
                                                       child: Text(
                                                         'OLA Electronic Scooter',
                                                         maxLines: 3,
                                                         style: TextStyle(
                                                             fontSize: 16.sp,
                                                             fontWeight: FontWeight.w500),
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
                                           SizedBox(height: 15),
                                           Padding(
                                             padding: const EdgeInsets.only(left: 10).r,
                                             child: Row(
                                               children: [
                                                 Icon(
                                                   Icons.location_on,size: 15.sp,
                                                   color: green.withOpacity(0.5),
                                                 ),
                                                 Container(
                                                   width: 180.w,
                                                   child: Text(
                                                     '4750 Arbutus #312, Vancouver',overflow: TextOverflow.ellipsis,
                                                     style: TextStyle(fontSize: 12.sp),
                                                   ),
                                                 ),
                                               ],
                                             ),
                                           ),
                                           SizedBox(
                                             height: 10.h,
                                           ),
                                           Padding(
                                             padding: const EdgeInsets.only(left: 10,right: 20).r,
                                             child: Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                               children: [
                                                 Row(
                                                   children: [
                                                     Icon(
                                                       Icons.bolt,
                                                       size: 15.sp,
                                                       color: green.withOpacity(0.5),
                                                     ),
                                                     Text(
                                                       'Type 2',
                                                       style: TextStyle(color: Colors.grey,fontSize: 12.sp),
                                                     ),
                                                   ],
                                                 ),
                                                 Row(
                                                   children: [
                                                     Icon(
                                                       Icons.battery_charging_full,
                                                       size: 15.sp,
                                                       color: green.withOpacity(0.5),
                                                     ),
                                                     Text(
                                                       'Type 2',
                                                       style: TextStyle(color: Colors.grey,fontSize: 12.sp),
                                                     ),
                                                   ],
                                                 ),
                                                 Row(
                                                   children: [
                                                     Icon(
                                                       Icons.charging_station,
                                                       size: 15.sp,
                                                       color: green.withOpacity(0.5),
                                                     ),
                                                     Text(
                                                       'Type 2',
                                                       style: TextStyle(color: Colors.grey,fontSize: 12.sp),
                                                     ),
                                                   ],
                                                 ),
                                               ],
                                             ),
                                           ),
                                           SizedBox(
                                             height: 10.h,
                                           ),
                                           Padding(
                                             padding: const EdgeInsets.only(left: 20).r,
                                             child: Text('50 Min Remaining',style: TextStyle(fontSize: 12.sp),),
                                           ),
                                         ],
                                       ),
                                       Positioned(
                                           left: 80.w,
                                           bottom: 65.h,
                                           child: Image(image: AssetImage('assets/images/bike_image-removebg-preview.png'),width: 160.w,height: 150.h,)),
                                     ],
                                   ),
                                 ),
                             ),
                           );
                        },)
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 15).r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Near by me',
                            style:
                                TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => demo(),));
                            },
                            child: Text('See All',
                                style: TextStyle(
                                    color: Colors.grey.shade600, fontSize: 15.sp)),
                          )
                        ],
                      ),
                    ),
                    Container(
                        width: 380.w,
                        height: 180.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return  Padding(
                              padding: const EdgeInsets.only(left: 15).r,
                              child: Container(
                                  width: 280.w,
                                  // decoration: BoxDecoration(
                                  //     color: Colors.white,
                                  //     borderRadius: BorderRadius.circular(20)),
                                  child: Card(
                                    elevation: 7,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20).w,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 15, top: 15).r,
                                              child: Container(
                                                width: 80.w,
                                                height: 80.h,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/images/App_logo.png'),
                                                        fit: BoxFit.cover),
                                                    borderRadius: BorderRadius.circular(15).w),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 15,left: 15).r,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'ChargePoint',
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight: FontWeight.w700),
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        Icons.location_on,
                                                        size: 15.sp,
                                                        color: green.withOpacity(0.5),
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      Container(
                                                        width: 130.w,
                                                        child: Text(
                                                          '451 Beach Crescent,BC V6Z 3H1',
                                                          style: TextStyle(fontSize: 12.sp),
                                                          overflow: TextOverflow.ellipsis,
                                                          maxLines: 2,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Icon(
                                                        Icons.directions_walk,
                                                        size: 15.sp,
                                                        color: green.withOpacity(0.5),
                                                      ),
                                                      SizedBox(
                                                        width: 5.h,
                                                      ),
                                                      Text('3.5 Km Away/50 Min',style: TextStyle(fontSize: 12.sp),),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Icon(Icons.star,size: 15.sp,color: green.withOpacity(0.5),),
                                                      SizedBox(
                                                        width: 5.h,
                                                      ),
                                                      Text('5.0',style: TextStyle(fontSize: 12.sp),),
                                                      SizedBox(
                                                        width: 20.h,
                                                      ),
                                                      Icon(Icons.bolt,size: 15.sp,color: green.withOpacity(0.5),),
                                                      SizedBox(
                                                        width: 5.h,
                                                      ),
                                                      Text('07',style: TextStyle(fontSize: 12.sp),),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10).w,
                                          child: Container(
                                            width: 350.w,
                                            height: 35.h,
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10).w,border: Border.all(width: 2,color: green.withOpacity(0.5))),
                                            child: Center(
                                              child: Text('Book Slot',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,color: green.withOpacity(0.5)),),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ),
                            );
                          },),
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
