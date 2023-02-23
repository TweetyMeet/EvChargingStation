// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class OwnerEvImage extends StatefulWidget {
//   final valu_of_index;
//   const OwnerEvImage({Key? key, this.valu_of_index}) : super(key: key);
//
//   @override
//   State<OwnerEvImage> createState() => _OwnerEvImageState();
// }
//
// class _OwnerEvImageState extends State<OwnerEvImage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             Container(
//               width: 400,
//               height: 800,
//               color: Colors.black,
//             ),
//             Center(
//               child: Container(
//                 width: 400,
//                 height: 750,
//                 child: Hero(
//                   tag: 'hello${widget.valu_of_index.toString()}',
//                   child: Image(
//                     image: AssetImage(
//                       'assets/images/large_8-removebg-preview.png'
//                     ),
//                     width: 300,
//                     height: 300,
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 25,
//                 child: IconButton(
//                   onPressed: () => Navigator.of(context).pop(),
//                   icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
//                 )
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
