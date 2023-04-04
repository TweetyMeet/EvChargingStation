import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../constants/constants.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}



class _SearchScreenState extends State<SearchScreen> {



  TextEditingController _cont = TextEditingController();



  Completer<GoogleMapController> Controller = Completer();

  static final CameraPosition _kLake = CameraPosition(
      target: LatLng(21.1597122,72.7700844), zoom: 14);

  List<Marker> list = [];

  Future acall() async {
    final dbRef = await FirebaseDatabase.instance.ref().child('0');
        dbRef.get().then((DataSnapshot snapshot){
      Map Main = snapshot.value as Map;
      List Main2 = Main["chargingStations"];
      lists(Main2);
    });
  }
  @override
  void initState(){
    acall();
    _cont.addListener((){
      onChange();
    });
    super.initState();
  }

  void lists(Main) {
    setState(() {
      for (var i = 0; i < Main.length; i++) {
        list.add(
          Marker(
            markerId: MarkerId('$i'),
            position: LatLng(Main[i]['location']['latitude'],
                Main[i]['location']['longitude']),
            infoWindow: InfoWindow(title: "address:",
            snippet:  '${Main[i]['address'].toString()}'),
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

  List<dynamic> _placesList = [];

  var uuid = Uuid();
  String _sessionToken = "122344";

  void onChange(){
    if(_sessionToken == null){
      setState(() {
        _sessionToken = uuid.v4();
      });
    }
    getSuggesion(_cont.text);
  }

  void getSuggesion(String input)async{
    String kPLACES_API_KEY = "AIzaSyCQS5e5tX4bncZcZyuWMpsmZNUVWF_Vwj8";
    String baseURL = "https://maps.googleapis.com/maps/api/place/autocomplete/json";
    String request = "$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoker=$_sessionToken";

    var response = await http.get(Uri.parse(request));
    var data = response.body.toString();

    debugPrint('data');
    debugPrint("$data");
    debugPrint('${response.body.toString()}');
    if(response.statusCode == 200){
      setState(() {
        _placesList = jsonDecode(response.body.toString()) ['predictions'];
      });
    }else{
      throw Exception('Failed to load data');
    }

  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
             GoogleMap(
                initialCameraPosition: _kLake,
                // polylines:_polylines,
                onMapCreated: (GoogleMapController controller) {
                  Controller.complete(controller);
                },
                mapType: MapType.normal,
                zoomControlsEnabled: true,

                markers: Set<Marker>.from(list),
               onTap: (position){
                 lists(position);
               },
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth*0.04,vertical: screenHeight*0.01),
              child: Column(
                children: [
                  Container(
                    height: screenHeight*0.06,
                    child: TextFormField(
                      controller: _cont,
                      style: TextStyle(color: textBlack),
                      cursorColor: black,
                      decoration: InputDecoration(
                        fillColor: white,
                        filled: true,
                        prefixIcon: Icon(Icons.search,
                          color: iconBlack,
                        ),
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.grey,fontSize: screenWidth*0.033),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 2,color: black),),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2,color: white),borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width: 2,color: white)),
                      ),
                      validator: (value) {

                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                        child: ListView.builder(
                          itemCount: _placesList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              color: white,
                              child: ListTile(
                                title: Text(_placesList[index]['description']),
                              ),
                            );
                          },
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
            getUserCurrentLocation().then((value)async{
            debugPrint("my current location");
            debugPrint(value.latitude.toString()+""+value.longitude.toString());
            // _updatePolyline( LatLng(value.latitude, value.longitude));
            GoogleMapController controller = await Controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
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
