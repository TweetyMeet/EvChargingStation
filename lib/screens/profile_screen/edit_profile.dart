

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev_project/Bottom_Nav_Bar/bottom_nav_bar.dart';
import 'package:ev_project/screens/profile_screen/my_profile.dart';
import 'package:ev_project/screens/profile_screen/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart'  as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      return null;
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

  String currentImage = "";

  @override
  void initState() {
    apcall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.only(left: 25, top: 10).r,
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
                              width: 30.w,
                              height: 30.h,)),
                        Text(
                          'Profile',
                          style: TextStyle(fontSize: 25.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
                           backgroundColor: Colors.greenAccent,
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
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: phone,
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
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                  SizedBox(height: 170,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(

                      onTap: () {
                          isLoading = isSaving;
                        if (formKey.currentState!.validate()) {
                          SystemChannels.textInput.invokeListMethod(
                              'TextInput.hide'
                          );
                          currentImage == null ?
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('select profile pic'))) :

                          saveinfo();
                        }
                      },
                      child: Container(
                        height: 50.h,
                        width: 340.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius
                              .circular(10)
                              .w,
                          color: green.withOpacity(0.5),
                        ),
                        child: Center(
                          child: Text(
                            'Save Profile',
                            style: TextStyle(fontSize: 14.sp,
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
      Map<String, dynamic> data = {
        'name': name.text,
        'phone': phone.text,
        'email': email.text,
        'profilePic': downloadUrl,
      };
      FirebaseFirestore.instance.collection('users').
      doc(FirebaseAuth.instance.currentUser!.uid).set(data).whenComplete(() {
        FirebaseAuth.instance.currentUser!.updateDisplayName(name.text);
        setState(() {
          isSaving = false;
        });
      });
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyProfile(),));
    });
  }
}


