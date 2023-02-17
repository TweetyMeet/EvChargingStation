import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  static final CameraPosition _kLake = CameraPosition(
    // bearing: 192.8334901395799,
      target: LatLng(21.1928425,72.7854571),
      // tilt: 59.440717697143555,
      zoom: 14.4746);

  List<Marker> marker = [];
  List<Marker> list = [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(21.1928425,72.7854571),
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
    );
  }
}

