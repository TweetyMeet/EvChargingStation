import 'package:clay_containers/clay_containers.dart';
import 'package:ev_project/constants/constants.dart';
import 'package:ev_project/homescreen/homescreen.dart';
import 'package:flutter/material.dart';



class BottomContainer extends StatefulWidget {
  final  String title;
  final  String subtitle;
  const BottomContainer({Key? key, required this.title, required this.subtitle}) : super(key: key);

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
                TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));

                  },
                  child: ClayContainer(
                    color: white,
                    depth: 20,
                    borderRadius: 30,
                    curveType: CurveType.convex,
                    child: Padding(
                      padding:   EdgeInsets.symmetric(vertical: appPadding/2,
                          horizontal:appPadding *2 ),
                      child: Text(widget.title,style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 17
                      ),),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: appPadding),
                  child: OutlinedButton(
                    onPressed: (){},
                    child: Text(widget.subtitle,style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 17,
                      decoration: TextDecoration.underline

                    ),),
                  ),
                ),

              ],
            ),
          ),

        ));
  }
}
