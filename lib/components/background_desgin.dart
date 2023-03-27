import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:ev_project/constants/constants.dart';
import 'package:flutter/material.dart';

class BackgroundDesign extends StatelessWidget {
  final bool back_button;
  const BackgroundDesign({Key? key, required this.back_button}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          color: white,
          height: screenHeight*0.4,
          child: Stack(
            children: [
              Positioned(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClayContainer(
                      color: white,
                      width: 220,
                      height: 220,
                      borderRadius: 200,
                      depth: 50,
                    curveType: CurveType.convex,
                    ),
                    ClayContainer(
                      color: white,
                      width: 100,
                      height: 100,
                      borderRadius: 200,
                      depth: 50,
                    ),
                    ClayContainer(
                      color: white,
                      width: 140,
                      height: 140,
                      borderRadius: 200,
                      depth: -50,
                      curveType: CurveType.convex,
                    ),
                    ClayContainer(
                      color: white,
                      width: 100,
                      height: 100,
                      borderRadius: 200,
                      depth: 50,
                  //    curveType: CurveType.convex,
                    ),
                  ],
                ),
                right: 0,
                top: -screenHeight*0.05,
              )
            ],
          ),
        ),
        Container(
          height: screenHeight*0.4,
          child: Stack(
            children: [
              Positioned(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClayContainer(
                      color: white,
                      width: 160,
                      height: 160,
                      borderRadius: 200,
                      depth: 50,
                      curveType: CurveType.convex,
                    ),
                    ClayContainer(
                      color: white,
                      width: 140,
                      height: 140,
                      borderRadius: 200,
                      depth: -50,
                      curveType: CurveType.convex,

                    ),
                    ClayContainer(
                      color: white,
                      width: 70,
                      height: 70,
                      borderRadius: 200,
                      depth: 50,
                    ),
                  ],

                ),
                left: -screenWidth*0.05,
                bottom: screenHeight*0.1,
              ),
          ],),
        ),
        Container(
          height: screenHeight*0.4,
          child: Stack(
            children: [
              Positioned(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClayContainer(
                     color: white,
                     width: 130,
                     height: 130,
                     borderRadius: 200,
                     depth: 50,
                     curveType: CurveType.convex,
                    ),
                    ClayContainer(
                      color: white,
                      width: 80,
                      height: 80,
                      borderRadius: 200,
                      depth: -50,
                      curveType: CurveType.convex,
                    ),
                    ClayContainer(
                      color: white,
                      width: 60,
                      height: 60,
                      borderRadius: 200,
                      depth: 50,

                    )
                  ],
                ),
                left: screenWidth*0.52,
                bottom: 0,

              ),

            ],
          ),
        ),
        back_button ?
        Positioned(top: 30,child: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,)))
            :
        SizedBox(),
      ],
    );
  }
}
