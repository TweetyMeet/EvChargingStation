import 'package:ev_project/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class booked_ev_card extends StatefulWidget {
  const booked_ev_card({Key? key}) : super(key: key);

  @override
  State<booked_ev_card> createState() => _booked_ev_cardState();
}

class _booked_ev_cardState extends State<booked_ev_card> {
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
                  child: Image(image: AssetImage('assets/images/bike_image-removebg-preview.png'),width: 160.w,height: 150.h,)),
            ],
          ),
    );
  }
}
