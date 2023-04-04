

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev_project/Bottom_Nav_Bar/bottom_nav_bar.dart';
import 'package:ev_project/screens/profile_screen/my_profile.dart';
import 'package:ev_project/screens/profile_screen/profile_screen.dart';
import 'package:ev_project/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart'  as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/constants.dart';


class editprofile extends StatefulWidget {
  const  editprofile({Key? key}) : super(key: key);


  @override
  State<editprofile> createState() =>  editprofileState();
}

class  editprofileState extends State< editprofile> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isSaving = false;
  bool isLoading = true;
   String? downloadUrl;

  Future<String?> uploadImage(File filepath, String? reference) async {
    try {
      final finalName = '${FirebaseAuth.instance.currentUser!.uid}${DateTime
          .now()
          .millisecond}';
      final Reference fbstorage = FirebaseStorage.instance.ref(reference).child(
          finalName);
      final UploadTask uploadTask = fbstorage.putFile(filepath);
      await  uploadTask.whenComplete(() async {
        downloadUrl = await fbstorage.getDownloadURL();

      });

      return downloadUrl;
    } catch (e) {
      print(e.toString());
    }
  }


  Future apcall()async{
    final dbRef = await FirebaseFirestore.instance.collection('users');
    dbRef.doc(FirebaseAuth.instance.currentUser!.uid).get().
    then((DocumentSnapshot<Map<String, dynamic>>snapshot) {
      name.text = snapshot['name'];
      phone.text = snapshot['phone'];
      email.text = snapshot['email'];
      String profilePic = snapshot['profilePic'].toString();
      lists(profilePic);
    });
  }

  void lists(main){
    setState(() {
      currentImage = main;
    });
  }

  String? currentImage;

  @override
  void initState() {
    apcall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: screenWidth*0.03),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => MyProfile()));
                            },
                            child: Image(image: AssetImage(
                                'assets/icons/back-arrow.png'),
                              color: black,
                              width:  screenWidth*0.08,
                              height: screenHeight*0.08,
                              )),
                        Text(
                          'Profile',
                          style: TextStyle(fontSize: screenWidth*0.065,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height:screenHeight*0.020,
                  ),
                  Center(
                    child: Padding(
                      padding:  EdgeInsets.all(screenWidth*0.035),
                      child: GestureDetector(
                        onTap: () async {
                          final pickImage = await ImagePicker().pickImage(
                            source: ImageSource.gallery,
                            imageQuality: 50,
                          );
                          if (pickImage != null) {
                            setState(() {
                              currentImage = pickImage.path;

                            });
                          }else{
                            print('error');
                          }
                        },
                        child: Container(
                          child: currentImage == null ? CircleAvatar(
                          radius: 70,
                           backgroundColor: green.withOpacity(0.5),
                          child: Image.asset("assets/images/add-photo.png",
                            height: 80,
                             width: 80,
                            ),
                          ) :
                          currentImage.toString().contains('http') ?
                          CircleAvatar(
                              radius: 70,
                              backgroundImage: NetworkImage(currentImage.toString())
                          )
                              : CircleAvatar(
                            radius: 70,
                            backgroundImage: FileImage(File(currentImage.toString())),
                          ),

                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight*0.038),
                  Padding(
                    padding:  EdgeInsets.all(screenWidth*0.03),
                    child: TextFormField(
                      controller: name,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "Should not be empty";
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "enter a name",
                          border: OutlineInputBorder()
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight*0.01,),
                  Padding(
                    padding: EdgeInsets.all(screenWidth*0.03),
                    child: TextFormField(
                      controller: phone,
                      keyboardType: TextInputType.number,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "Should not be empty";
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "enter a phone number",
                          border: OutlineInputBorder()
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight*0.01,),
                  Padding(
                    padding:  EdgeInsets.all(screenWidth*0.03),
                    child: TextFormField(
                      controller: email,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "Should not be empty";
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "enter an email",

                          border: OutlineInputBorder()
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight*0.165),
                  Padding(
                    padding: EdgeInsets.all(screenWidth*0.03),
                    child: InkWell(
                      onTap: () {
                        uploadImage(File(currentImage!), 'Profile');
                          isLoading = isSaving;
                        if (formKey.currentState!.validate()) {
                          SystemChannels.textInput.invokeListMethod(
                              'TextInput.hide'
                          );
                            saveinfo();

                        }
                      },
                      child: Container(
                        height: screenHeight*0.074,
                        width: screenWidth*0.94,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius
                              .circular(10),
                          color: green.withOpacity(0.5),
                        ),
                        child: Center(
                          child: Text(
                            'Save Profile',
                            style: TextStyle(fontSize:  screenWidth*0.05,
                                color: textBlack,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }




  saveinfo() {
    setState(() {
      isSaving = true;
    });
    uploadImage(File(currentImage!), 'Profile').whenComplete(() {
      if(downloadUrl.toString().contains('http')) {
        Map<String, dynamic> data = {
          'name': name.text,
          'phone': phone.text,
          'email': email.text,
          'profilePic': downloadUrl,
        };
        FirebaseFirestore.instance.collection('users').
        doc(FirebaseAuth.instance.currentUser!.uid)
            .update(data)
            .whenComplete(() {
          FirebaseAuth.instance.currentUser!.updateDisplayName(name.text);
          setState(() {
            isSaving = false;
          });
        });
      } else{
        Map<String, dynamic> data = {
          'name': name.text,
          'phone': phone.text,
          'email': email.text,
          'profilePic': currentImage,
        };
        FirebaseFirestore.instance.collection('users').
        doc(FirebaseAuth.instance.currentUser!.uid)
            .update(data)
            .whenComplete(() {
          FirebaseAuth.instance.currentUser!.updateDisplayName(name.text);
          setState(() {
            isSaving = false;
          });
        });
      }
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyProfile(),));
    });
  }
}


