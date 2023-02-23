// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// Map? mapResponse;
// List? listResponse;
//
// class demo extends StatefulWidget {
//   const demo({Key? key}) : super(key: key);
//
//   @override
//   State<demo> createState() => demoState();
// }
//
// class demoState extends State<demo> {
//
//   Future apicall() async {
//     http.Response response;
//     response = await http.get(
//         Uri.parse('https://developer.nrel.gov/api/alt-fuel-stations/v1.json?api_key=DEMO_KEY&status=all,E,P,T&access=private&fuel_type=ELEC'));
//     if (response.statusCode == 200) {
//       setState(() {
//         mapResponse = json.decode(response.body);
//         listResponse = mapResponse!['fuel_stations'];
//       });
//     }
//   }
//
//   @override
//   void initState() {
//     apicall();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: FutureBuilder<dynamic>(
//             future: apicall(),
//             builder: (context, snapshot) {
//               return snapshot.hasData
//                   ? Center(child: CircularProgressIndicator(color: Colors.red,))
//                   : ListView.builder(
//                 // scrollDirection: Axis.horizontal,
//                 itemCount: listResponse!.length,
//                 itemBuilder: (context, index) {
//                   return  Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: Container(
//                       width: 400,
//                       height: 220,
//                       decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(20)),
//                       child: Column(
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Container(
//                                   width: 100,
//                                   height: 100,
//                                   decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/App_logo.png'),fit: BoxFit.cover),borderRadius: BorderRadius.circular(15)),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text('ChargePoint',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600,decoration: TextDecoration.none)),
//                                     Row(
//                                       children: [
//                                         Icon(Icons.location_on),
//                                         Text(listResponse![index]['street_address'].toString(),maxLines: 2,style: TextStyle(overflow: TextOverflow.ellipsis,color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600,decoration: TextDecoration.none)),
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         Icon(Icons.directions_walk),
//                                         Text('3.5 Km Away/50 Min',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600,decoration: TextDecoration.none)),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             },
//         ),
//       ),
//     );
//   }
// }
