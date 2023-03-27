import 'package:ev_project/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        height: screenHeight*0.057,
        child: TextFormField(
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
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(width: 2,color: black),),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2,color: white),borderRadius: BorderRadius.circular(15)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(width: 2,color: white)),
          ),
        ),
      ),
    );
  }
}
