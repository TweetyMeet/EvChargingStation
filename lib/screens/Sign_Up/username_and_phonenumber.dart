import 'dart:async';

import 'package:clay_containers/widgets/clay_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:ev_project/constants/constants.dart';
import 'package:ev_project/screens/Login_Screen/Log_in.dart';
import 'package:ev_project/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:email_auth/email_auth.dart';
import '../../components/background_desgin.dart';
import '../../components/bottomcontainer.dart';
import '../email_Verifying_Screen/email_verifying_screen.dart';
import 'SignUP.dart';

class add_username extends StatefulWidget {
  const add_username({Key? key}) : super(key: key);

  @override
  State<add_username> createState() => _add_usernameState();
}

class _add_usernameState extends State<add_username> {
  bool loading = false;
  final formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  bool isSaving = false;
  bool isLoading = true;


  @override
  void dispose() {
  }

  bool passwordObscureText = true;
  bool confiemPasswordObscureText = true;

  // Future apcall()async{
  //   final dbRef = await FirebaseFirestore.instance.collection('users');
  //   dbRef.doc(FirebaseAuth.instance.currentUser!.uid).get().
  //   then((DocumentSnapshot<Map<String, dynamic>>snapshot) {
  //     nameController.text = snapshot['name'];
  //     phoneController.text = snapshot['phone'];
  //   });
  // }

  saveinfo() {
    setState(() {
      isSaving = true;
    });
      Map<String, dynamic> data = {
        'name': nameController.text,
        'phone': phoneController.text,
      };
      FirebaseFirestore.instance.collection('users').
      doc(FirebaseAuth.instance.currentUser!.uid).set(data).whenComplete(() {
        FirebaseAuth.instance.currentUser!.updateDisplayName(nameController.text);
        setState(() {
          isSaving = false;
        });
      });
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LogIN(),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Container(
          width: 400.w,
          height: 730.h,
          child: Stack(
            children: [
              BackgroundDesign(
                back_button: false,
              ),
              Positioned(
                top: 170.h,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.all(appPadding).w,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello',
                          style: TextStyle(
                              fontSize: 35.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Let\'s get started',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: black.withOpacity(0.6),
                              fontWeight: FontWeight.w800),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: appPadding)
                              .r,
                          child: Form(
                            key: formkey,
                            child: Column(
                              children: [
                                Container(
                                  child: ClayContainer(
                                    color: white,
                                    borderRadius: 30.r,
                                    depth: -30,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: appPadding)
                                          .r,
                                      child: TextFormField(
                                        controller: nameController,
                                        decoration: InputDecoration(
                                          hintText: 'Username',
                                          border: InputBorder.none,
                                          fillColor: black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  child: ClayContainer(
                                    color: white,
                                    borderRadius: 30.r,
                                    depth: -30,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: appPadding)
                                          .r,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: phoneController,
                                        decoration: InputDecoration(
                                          hintText: 'Enter Number',
                                          border: InputBorder.none,
                                          fillColor: black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              BottomContainer(
                title: 'Next Page',
                loading: loading,
                onTap: () {
                  isLoading = isSaving;
                  if (formkey.currentState!.validate()) {
                    SystemChannels.textInput.invokeListMethod(
                        'TextInput.hide'
                    );
                    saveinfo();
                  }
                },
                subtitle: 'Log In',
                account: 'Already have an account?',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
