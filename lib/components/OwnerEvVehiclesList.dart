import 'package:ev_project/screens/homescreen/OwnerEvImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OwnerEvVehiclesList extends StatefulWidget {
  const OwnerEvVehiclesList({Key? key}) : super(key: key);

  @override
  State<OwnerEvVehiclesList> createState() => _OwnerEvVehiclesListState();
}

class _OwnerEvVehiclesListState extends State<OwnerEvVehiclesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: 360,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 7,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 140,
                        height: 180,
                        decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => OwnerEvImage(valu_of_index: index.toString()),));
                        },
                        child: Hero(
                          tag: 'hello${index}',
                          child: Image(image: AssetImage('assets/images/large_0-removebg-preview.png'),width: 200,height: 100,),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 160,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Hello!!',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700),),
                            Text('Are you ready?',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
    );
  }
}
