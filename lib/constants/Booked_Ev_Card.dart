import 'package:ev_project/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          // elevation: 7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 10),
                    child: Container(
                      width: 220,
                      height: 90,
                      decoration: BoxDecoration(
                          color: green.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 150,
                              child: Text(
                                  'OLA Electronic Scooter',
                                  maxLines: 3,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,size: 15,
                          color: green.withOpacity(0.5),
                        ),
                        Container(
                          width: 180,
                          child: Text(
                            '4750 Arbutus #312, Vancouver',overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            children: [
                              Icon(
                                Icons.bolt,
                                size: 15,
                                color: green.withOpacity(0.5),
                              ),
                              Text(
                                'Type 2',
                                style: TextStyle(color: Colors.grey,fontSize: 12),
                              ),
                            ],
                          ),
                        Row(
                          children: [
                            Icon(
                              Icons.battery_charging_full,
                              size: 15,
                              color: green.withOpacity(0.5),
                            ),
                            Text(
                              'Type 2',
                              style: TextStyle(color: Colors.grey,fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.charging_station,
                              size: 15,
                              color: green.withOpacity(0.5),
                            ),
                            Text(
                              'Type 2',
                              style: TextStyle(color: Colors.grey,fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text('50 Min Remaining',style: TextStyle(fontSize: 12),),
                  ),
                ],
              ),
              Positioned(
                  left: 160,
                  bottom: 65,
                  child: Image(image: AssetImage(cars[widget.number_for_car_images]),width: 160,height: 150,)),
            ],
          ),
    );
  }
}
