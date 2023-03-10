import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

late Map map_Response2;
late List list_Response2;

class _SearchScreenState extends State<SearchScreen> {
  Completer<GoogleMapController> Controller = Completer();

  static final CameraPosition _kLake = CameraPosition(
      target: LatLng(34.2483191527193,-118.3879713743439 ), zoom: 14);

  List<Marker> list = [];

  Future acall() async {
    http.Response response2;
    response2 = await http.get(Uri.parse('https://developer.nrel.gov/api/alt-fuel-stations/v1.json?fuel_type=E85,ELEC&state=CA&limit=100&api_key=QuEPLICmDoiLzA59WpMLBLueLtRdumgPfUCPpJFj'));
    if (response2.statusCode == 200) {
      setState(() {
        map_Response2 = json.decode(response2.body);
        list_Response2 = map_Response2['fuel_stations'];
        lists(list_Response2);
      });
    }
  }

  @override
  void initState(){
    acall();
    super.initState();
  }

  void lists(list_Response2) {
    setState(() {
      for (var i = 0; i < list_Response2.length; i++) {
        list.add(
          Marker(
            markerId: MarkerId('$i'),
            position: LatLng(list_Response2[i]['latitude'],
                list_Response2[i]['longitude']),
          ),
        );
      }
    });
  }

  Future<Position> getUserCurrentLocation() async{
    await Geolocator.requestPermission().then((value){

    }).onError((error, stackTrace){
      debugPrint("error"+error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          initialCameraPosition: _kLake,
          onMapCreated: (GoogleMapController controller) {
            Controller.complete(controller);
          },
          mapType: MapType.normal,
          zoomControlsEnabled: false,
          markers: Set<Marker>.from(list),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
            getUserCurrentLocation().then((value)async{
            debugPrint("my current location");
            debugPrint(value.latitude.toString()+""+value.longitude.toString());
            GoogleMapController controller = await Controller.future;
            controller
                .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              target: LatLng(value.latitude, value.longitude),
              zoom: 14,
            )));
            setState(() {});
            list.add(
              Marker(markerId: MarkerId('live'),
                position: LatLng(value.latitude,
                    value.longitude),
              ),
            );
          });
          },
          child: Icon(Icons.my_location_outlined),
        ),
      ),
    );
  }
}
