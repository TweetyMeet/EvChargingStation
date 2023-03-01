import 'package:ev_project/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0).w,
      child: Container(
        height: 40.h,
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
            hintStyle: TextStyle(color: Colors.grey,fontSize: 13.sp),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15).w,
            borderSide: BorderSide(width: 2,color: black),),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 2,color: white),borderRadius: BorderRadius.circular(15).w),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15).w,borderSide: BorderSide(width: 2,color: white)),
          ),
        ),
      ),
    );
  }
}
