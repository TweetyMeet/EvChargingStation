import 'package:clay_containers/clay_containers.dart';
import 'package:ev_project/Sign_Up/SignUP.dart';
import 'package:ev_project/constants/constants.dart';
import 'package:ev_project/homescreen/homescreen.dart';
import 'package:ev_project/screens/Login_Screen/Log_in.dart';
import 'package:flutter/material.dart';



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

    Size size = MediaQuery.of(context).size;

    return Positioned(
      bottom: 0,
        left: 0,
        right: 0,
        child: InkWell(
          onTap: widget.onTap,

          child: Container(
            child: ClayContainer(

              color: white,
              height: size.height * 0.3,
              depth: 60,
              spread: 20,
              customBorderRadius: BorderRadius.only(
                  topRight:Radius.elliptical(350, 250),
                  topLeft:Radius.elliptical(350, 250),
              ),
              child: Column(
                children: [
                  SizedBox(height: size.height*0.07,),
              ClayContainer(
                      color: white,
                      depth: 20,
                      borderRadius: 30,
                      curveType: CurveType.convex,
                      child: Padding(
                        padding:   EdgeInsets.symmetric(vertical: appPadding/2,
                            horizontal:appPadding *2 ),
                        child: widget.loading ? CircularProgressIndicator(color: black,) :
                        Text(widget.title,style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 17
                        ),),
                      ),
                    ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.account,style: TextStyle(color: black),),
                      TextButton(onPressed: (){
                          if(widget.subtitle.toString() == 'Sign In'){

                                Navigator.push(context, MaterialPageRoute(builder: (context)=> SignIn() ));

                          }else {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> LogIN() ));
                          }
                      },
                          child: Text(widget.subtitle,style: TextStyle(color: black),)
                      ),
                    ],
                  )
                ],
              ),
            ),

          ),
        ));
  }
}
