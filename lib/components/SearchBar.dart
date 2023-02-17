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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: TextFormField(
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            fillColor: Colors.black,
            filled: true,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(width: 2,color: Colors.white),),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.white),borderRadius: BorderRadius.circular(30)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: BorderSide(width: 2,color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
