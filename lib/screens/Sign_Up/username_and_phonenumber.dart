import 'dart:async';

import 'package:clay_containers/constants.dart';
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
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isSaving = false;
  bool isLoading = true;

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
      doc(FirebaseAuth.instance.currentUser!.uid).update(data).whenComplete(() {
        FirebaseAuth.instance.currentUser!.updateDisplayName(nameController.text);

        setState(() {
          isSaving = false;
        });
      });
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LogIN(),));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth*1,
          height: screenHeight*1,
          child: Stack(
            children: [
             const BackgroundDesign(
                back_button: false,
              ),
              Positioned(
                top: screenHeight*0.23,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.all(screenWidth*0.06),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   'Hello',
                        //   style: TextStyle(
                        //       fontSize: 35, fontWeight: FontWeight.bold),
                        // ),
                        Text(
                          'Let\'s get started',
                          style: TextStyle(
                              fontSize: screenWidth*0.1,
                              color: black,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.symmetric(vertical: screenHeight*0.03),
                          child: Form(
                            key: formkey,
                            child: Column(
                              children: [
                                Container(
                                  child: ClayContainer(
                                    color: white,
                                    borderRadius: 30,
                                    depth: -30,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth*0.08),
                                      child: TextFormField(
                                        controller: nameController,
                                        decoration: const InputDecoration(
                                          hintText: 'Username',
                                          border: InputBorder.none,
                                          fillColor: black,
                                        ),
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        validator: (value){
                                          if (value!.isEmpty) {
                                            return 'Enter Username';
                                          } else{
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight*0.02,
                                ),
                                Container(
                                  child: ClayContainer(
                                    color: white,
                                    borderRadius: 30,
                                    depth: -30,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth*0.08),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: phoneController,
                                        decoration: const InputDecoration(
                                          hintText: 'Enter Number',
                                          border: InputBorder.none,
                                          fillColor: black,
                                        ),
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        validator: (value){
                                          if(value!.isEmpty){
                                            return 'Enter mobile number';
                                          }else{
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight*0.02,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              Positioned(
                bottom: screenHeight*0.03,
                left: 0,
                right: 0,
                child: Container(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          if (formkey.currentState!.validate()) {
                            saveinfo();
                          }
                        },
                        child: ClayContainer(
                          color: white,
                          depth: 40,
                          borderRadius: 30,
                          curveType: CurveType.convex,
                          child: Padding(
                            padding:   EdgeInsets.symmetric(vertical: screenHeight*0.02,
                                horizontal: screenWidth*0.17),
                            child:
                            Text('Log In Page',style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: screenWidth*0.047
                            ),),
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
