import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  Completer<GoogleMapController> Controller = Completer();

static final CameraPosition _kLake = CameraPosition(
    // bearing: 192.8334901395799,
      target: LatLng(34.2483191527193,-118.3879713743439),
      // tilt: 59.440717697143555,
      zoom: 14.4746);

  List<Marker> marker = [];
  List<Marker> list = [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(34.2483191527193,-118.3879713743439),
    ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(34.052542,-118.448504),
    ),
    Marker(
      markerId: MarkerId('3'),
      position: LatLng(34.059133,-118.248589),
    ),
    Marker(
      markerId: MarkerId('4'),
      position: LatLng(33.759802,-118.096665),
    ),
  ];

  @override
  void initState(){
    super.initState();
    marker.addAll(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kLake,
        mapType: MapType.normal,
        markers: Set<Marker>.of(marker),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
        GoogleMapController controller = await Controller.future;
        controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(33.759802,-118.096665),
          zoom: 14,
          )
        ));
        setState(() {

        });
      },
        child: Icon(Icons.my_location),
      ),
    );
  }
}

