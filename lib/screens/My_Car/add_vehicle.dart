
import 'package:ev_project/screens/My_Car/my_car.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class Addvehicle extends StatefulWidget {
  const Addvehicle({Key? key}) : super(key: key);

  @override
  State<Addvehicle> createState() => _AddvehicleState();
}

class _AddvehicleState extends State<Addvehicle> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
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
                              builder: (context) => MyCar()));
                        },
                        child: Image(image: AssetImage(
                            'assets/icons/back-arrow.png'),
                          color: black,
                          width:  screenWidth*0.08,
                          height: screenHeight*0.08,
                        )),
                    Text(
                      'Add Vehicle',
                      style: TextStyle(fontSize: screenWidth*0.065,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                  ),
                SizedBox(height: screenHeight*0.01),

                Padding(
                  padding : EdgeInsets.only(left: screenWidth*0.0488),
                  child: Text('Select your vehicle type',style: TextStyle(fontSize: screenWidth*0.041),),
                ),
                Padding(
                  padding:  EdgeInsets.all(screenWidth*0.045),
                  child:  SizedBox(
                    height: screenHeight*0.069,
                    width: screenWidth*0.9,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: screenWidth*0.0488),
                  child: Text('Select your vehicle model',style: TextStyle(fontSize: screenWidth*0.041),),
                ),
                Padding(
                  padding:  EdgeInsets.all(screenWidth*0.045),
                  child:  SizedBox(
                    height: screenHeight*0.069,
                    width: screenWidth*0.9,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: screenWidth*0.0488),
                  child: Text('Select your vehicle charge type',style: TextStyle(fontSize: screenWidth*0.041),),
                ),
                Padding(
                  padding:  EdgeInsets.all(screenWidth*0.045),
                  child:  SizedBox(
                    height: screenHeight*0.069,
                    width: screenWidth*0.9,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),

                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth*0.0488),
                  child: Text('Input time of full charging',style: TextStyle(fontSize: screenWidth*0.041),),
                ),
                Padding(
                  padding:  EdgeInsets.all(screenWidth*0.045),
                  child:  SizedBox(
                    height: screenHeight*0.069,
                    width: screenWidth*0.9,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),

                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: screenWidth*0.0488),
                  child: Text('Input number of vehicle',style: TextStyle(fontSize: screenWidth*0.041),),
                ),
                Padding(
                  padding: EdgeInsets.all(screenWidth*0.045),
                  child: SizedBox(
                    height: screenHeight*0.069,
                    width: screenWidth*0.9,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),

                    ),
                  ),
                ),
                SizedBox(height: screenHeight*0.04,),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth*0.03),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: screenHeight*0.074,
                        width: screenWidth*0.91,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius
                              .circular(10),
                          color: green.withOpacity(0.5),
                        ),
                        child: Center(
                          child: Text(
                            'Add Vehicle',
                            style: TextStyle(fontSize:  screenWidth*0.05,
                                color: textBlack,
                                fontWeight: FontWeight.w500),
                          ),
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
