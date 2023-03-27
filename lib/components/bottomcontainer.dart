import 'package:clay_containers/clay_containers.dart';
import 'package:ev_project/constants/constants.dart';
import 'package:ev_project/screens/Login_Screen/Log_in.dart';
import 'package:flutter/material.dart';

import '../screens/Sign_Up/SignUP.dart';
import '../screens/forgotpassword/forgot_pass.dart';



class BottomContainer extends StatefulWidget {
  final bool  loading;
  final  String title;
  final VoidCallback onTap;
  final String  subtitle;
  final String account;

  
  const BottomContainer({Key? key,this.loading = false,
    required this.title,
    required this.onTap, required this.subtitle, required this.account,}) : super(key: key);

  @override
  State<BottomContainer> createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Positioned(
      bottom: 0,
        left: 0,
        right: 0,
          child: Container(
            child: ClayContainer(
              color: white,
              height: screenHeight * 0.25,
              depth: -40,
              spread: 20,
              customBorderRadius: BorderRadius.only(
                  topRight:Radius.elliptical(350, 250),
                  topLeft:Radius.elliptical(350, 250),
              ),
              child: Column(
                children: [
                  SizedBox(height: screenHeight*0.07,),
              InkWell(
                onTap: widget.onTap,
                child: ClayContainer(
                        color: white,
                        depth: 40,
                        borderRadius: 30,
                        curveType: CurveType.convex,
                        child: Padding(
                          padding:   EdgeInsets.symmetric(vertical: screenHeight*0.02,
                              horizontal:screenWidth*0.17 ),
                          child: widget.loading ? CircularProgressIndicator(color: black,) :
                          Text(widget.title,style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: screenWidth*0.047
                          ),),
                        ),
                      ),
              ),
                  SizedBox(height: screenHeight*0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.account,style: TextStyle(color: black),),
                      TextButton(onPressed: (){
                          if(widget.subtitle.toString() == 'Sign Up'){

                                Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp() ));

                          }else {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> LogIN() ));
                          }
                      },
                          child: Text(widget.subtitle,style: TextStyle(color: black),)
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ),
        );
  }
}
