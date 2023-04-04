import 'package:ev_project/Bottom_Nav_Bar/bottom_nav_bar.dart';
import 'package:ev_project/screens/My_Car/add_vehicle.dart';
import 'package:flutter/material.dart';

import '../../constants/Booked_Ev_Card.dart';
import '../../constants/constants.dart';
import '../profile_screen/my_profile.dart';



class MyCar extends StatefulWidget {
  const MyCar({Key? key}) : super(key: key);

  @override
  State<MyCar> createState() => _MyCarState();
}

class _MyCarState extends State<MyCar> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding:  EdgeInsets.all(screenWidth*0.029),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: screenWidth*0.03),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Bottom_Nav_Bar()));
                          },
                          child: Image(image: AssetImage(
                              'assets/icons/back-arrow.png'),
                            color: black,
                            width:  screenWidth*0.08,
                            height: screenHeight*0.08,
                          )),
                      Text(
                        'My Car',
                        style: TextStyle(fontSize: screenWidth*0.065,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context,index){
                      return Container(
                        height: screenHeight*0.3,
                        width: screenWidth*0.6,
                        child: booked_ev_card(number_for_car_images: index),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: screenHeight*0.08,
                ),
                Padding(
                  padding: EdgeInsets.all(screenWidth*0.03),
                  child: InkWell(
                    onTap: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context) => Addvehicle(),));

                    },
                    child: Container(
                      height: screenHeight*0.078,
                      width: screenWidth*0.94,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: green.withOpacity(0.5),
                      ),

                      child: Center(
                        child: Text(
                          'Add New Vehicle',
                          style: TextStyle(fontSize: screenWidth*0.05, color: textBlack,fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),

    ));
  }
}
