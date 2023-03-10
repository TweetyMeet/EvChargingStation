import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../constants/constants.dart';

class demo extends StatefulWidget {

  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => demoState();
}

late Map mapResponse;
late List listResponse;

class demoState extends State<demo> {

  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse('https://developer.nrel.gov/api/alt-fuel-stations/v1.json?fuel_type=E85,ELEC&state=CA&limit=200&api_key=QuEPLICmDoiLzA59WpMLBLueLtRdumgPfUCPpJFj'));
        if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse!['fuel_stations'];
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(onPressed: () {
              Navigator.of(context).pop();
            }, icon: Icon(Icons.arrow_back_ios_new)),
            Expanded(
              child: FutureBuilder(
                future: apicall(),
                builder:(context, snapshot) {
                return snapshot.hasData
                    ? Center(child: CircularProgressIndicator(color: Colors.red,))
                    :
                ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: listResponse!.length,
                  itemBuilder: (context,index){
                    return Container(
                      height: 200,
                      width: 400,
                      child: Card(
                        elevation: 7,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,top: 10),
                                  child: Container(
                                    width: 220,
                                    height: 90,
                                    decoration: BoxDecoration(
                                        color: green.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10, left: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 150,
                                            child: Text(
                                              'OLA Electronic Scooter',
                                              maxLines: 3,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,size: 15,
                                        color: green.withOpacity(0.5),
                                      ),
                                      Container(
                                        width: 180,
                                        child: Text(
                                          listResponse![index]['street_address'].toString(),overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.bolt,
                                            size: 15,
                                            color: green.withOpacity(0.5),
                                          ),
                                          Text(
                                            listResponse![index]['ev_pricing'].toString() == 'null' ? '\$3.0 per hour' : listResponse![index]['ev_pricing'].toString(),
                                            style: TextStyle(color: Colors.grey,fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.battery_charging_full,
                                            size: 15,
                                            color: green.withOpacity(0.5),
                                          ),
                                          Text(
                                            'Type 2',
                                            style: TextStyle(color: Colors.grey,fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.charging_station,
                                            size: 15,
                                            color: green.withOpacity(0.5),
                                          ),
                                          Text(
                                            'Type 2',
                                            style: TextStyle(color: Colors.grey,fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                // google_map(),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text('50 Min Remaining',style: TextStyle(fontSize: 12),),
                                ),
                              ],
                            ),
                            Positioned(
                                left: 160,
                                bottom: 65,
                                child: Image(image: AssetImage('assets/images/App_logo-removebg-preview.png'),width: 160,height: 150,)),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },),
            )
          ],
        ),
      ),
    );
  }
}
