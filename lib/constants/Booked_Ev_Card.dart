import 'package:ev_project/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class booked_ev_card extends StatefulWidget {
  final number_for_car_images;
  const booked_ev_card({Key? key, this.number_for_car_images}) : super(key: key);

  @override
  State<booked_ev_card> createState() => _booked_ev_cardState();
}

class _booked_ev_cardState extends State<booked_ev_card> {

  List cars = [
    'assets/images/large-removebg-preview.png',
    'assets/images/large_8-removebg-preview.png',
    'assets/images/large__3_-removebg-preview.png',
    'assets/images/large__4_-removebg-preview.png',
    'assets/images/large-removebg-preview.png',
    'assets/images/large_8-removebg-preview.png',
    'assets/images/large__3_-removebg-preview.png',
    'assets/images/large__4_-removebg-preview.png',
    'assets/images/large__3_-removebg-preview.png',
    'assets/images/large__4_-removebg-preview.png',
  ];

  @override
  Widget build(BuildContext context) {
    return  Card(
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
                      width: 220.w,
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
                              width: 150.w,
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
                  SizedBox(height: 15.h),
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
                  left: 160.w,
                  bottom: 65.h,
                  child: Image(image: AssetImage(cars[widget.number_for_car_images]),width: 160.w,height: 150.h,)),
            ],
          ),
    );
  }
}
