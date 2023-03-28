import 'package:ev_project/components/settings/settingscreen.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';



class description extends StatefulWidget {
  var Text;
  description({Key? key,required this.Text}) : super(key: key);

  @override
  State<description> createState() => _descriptionState();
}

class _descriptionState extends State<description> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: screenWidth*0.02),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Setting()));
                        },
                        child: Image(image: AssetImage('assets/icons/back-arrow.png'),color: black,
                            width: screenWidth*0.08,height: screenHeight*0.08)),
                    SizedBox(width: screenHeight*0.01),
                    Text(
                      widget.Text.toString(),
                      style: TextStyle(fontSize: screenWidth*0.065, fontWeight: FontWeight.bold),
                    ),

                  ],
                ),

              ],
            ),
          ),
          SizedBox(height: screenHeight*0.02),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.04,vertical: screenHeight*0.01),
            child: Text('1. Types of Data we collect',style: TextStyle(fontWeight: FontWeight.bold,fontSize: screenWidth*0.055),),
          ),
          Padding(
            padding:   EdgeInsets.symmetric(horizontal: screenWidth*0.05,vertical: screenHeight*0.01),
            child: Container(
              width:screenWidth*0.9,
              child: Text(maxLines: 5,'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Recusandae modi laboriosam delectus praesentium id quam quae harum expedita nulla quo voluptates voluptatum, quis blanditiis repellat fugit dolores ipsam quia ipsum illo error rerum consequatur omnis aliquid aut. Quaerat sit fugit blanditiis possimus ducimus, quisquam aspernatur vel, molestiae, mollitia officiis autem.'),
            ),
          ),
          SizedBox(height: screenHeight*0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth*0.04,vertical: screenHeight*0.01),
            child: Text('2. Use of your personal data',style: TextStyle(fontWeight: FontWeight.bold,fontSize: screenWidth*0.055),),
          ),
          Padding(
            padding:   EdgeInsets.symmetric(horizontal: screenWidth*0.05,vertical: screenHeight*0.01),
            child: Container(
              width:screenWidth*0.9,

              child: Text(maxLines: 5,'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Recusandae modi laboriosam delectus praesentium id quam quae harum expedita nulla quo voluptates voluptatum, quis blanditiis repellat fugit dolores ipsam quia ipsum illo error rerum consequatur omnis aliquid aut. Quaerat sit fugit blanditiis possimus ducimus, quisquam aspernatur vel, molestiae, mollitia officiis autem.'),
            ),
          ),
          SizedBox(height: screenHeight*0.02),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.04,vertical: screenHeight*0.01),
            child: Text('3. Disclousure of your personal Data ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: screenWidth*0.055),),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth*0.05,vertical: screenHeight*0.01),
            child: Container(
              width: screenWidth*0.9,

              child: Text(maxLines: 5,'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Recusandae modi laboriosam delectus praesentium id quam quae harum expedita nulla quo voluptates voluptatum, quis blanditiis repellat fugit dolores ipsam quia ipsum illo error rerum consequatur omnis aliquid aut. Quaerat sit fugit blanditiis possimus ducimus, quisquam aspernatur vel, molestiae, mollitia officiis autem.'),
            ),
          ),
      ],),
    ));
  }
}
