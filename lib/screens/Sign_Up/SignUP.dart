import 'dart:async';

import 'package:clay_containers/widgets/clay_container.dart';
import 'package:email_validator/email_validator.dart';
import 'package:ev_project/constants/constants.dart';
import 'package:ev_project/screens/Login_Screen/Log_in.dart';
import 'package:ev_project/screens/Sign_Up/username_and_phonenumber.dart';
import 'package:ev_project/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_auth/email_auth.dart';
import '../../components/background_desgin.dart';
import '../../components/bottomcontainer.dart';
import '../email_Verifying_Screen/email_verifying_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool loading = false;
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ConfirmPasswordController = TextEditingController();
  // final otpController = TextEditingController();
  final emailfocusnode = FocusNode();
  final passwordfocusnode = FocusNode();
  FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }


  bool passwordObscureText = true;
  bool confiemPasswordObscureText = true;

  bool isEmail(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(email);
  }
  // EmailAuth emailAuth =  new EmailAuth(sessionName: "Sample session");
  //
  // void sendOTP() async {
  //   var res = await emailAuth.sendOtp(recipientMail: emailController.text,otpLength: 5);
  //   if (res) {
  //     print('OTP send');
  //   }else{
  //     print('We could not sent the OTP');
  //   }
  // }
  //
  // void verifyOTP() {
  //   var res = emailAuth.validateOtp(
  //   recipientMail: emailController.text,
  //       userOtp: otpController.text);
  //   if(res) {
  //     print('otp valid');
  //   }else{
  //     print('Invalid OTP');
  //   }
  // }

  void SingUp(){
    setState(() {
      loading = true;
    });

    _auth
        .createUserWithEmailAndPassword(
        email: emailController.text.toString().trim(),
        password: passwordController.text.toString().trim())
        .then((value) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => add_username(),
      ));
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      var s1 = error.toString().split(']');
      Utils().toastMessage(s1[1].toString());
      setState(() {
        loading = false;
      });
    });
  }


  // @override
  // void initState() {
  //   emailAuth = new EmailAuth(sessionName: "Sample session",);
  //   super.initState();
  // }


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
              BackgroundDesign(
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
                        //       fontSize: screenWidth*0.1, fontWeight: FontWeight.bold),
                        // ),
                        Text(
                          'Let\'s create your account',
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
                                        keyboardType: TextInputType.emailAddress,
                                        controller: emailController,
                                        focusNode: emailfocusnode,
                                        onFieldSubmitted: (value) {
                                          Utils.fieldFocus(
                                              context,
                                              emailfocusnode,
                                              passwordfocusnode);
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'Email',
                                          border: InputBorder.none,
                                          fillColor: black,
                                        ),
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Enter email';
                                          } else if(value == value.trim()) {
                                            if (isEmail(value)) {
                                              return null;
                                            } else {
                                              return 'Enter valid email';
                                            }
                                          }else {
                                            return "email don't accept spaces";
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
                                        keyboardType: TextInputType.text,
                                        controller: passwordController,
                                        focusNode: passwordfocusnode,
                                        obscureText: passwordObscureText,
                                        decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  passwordObscureText =
                                                      !passwordObscureText;
                                                });
                                              },
                                              icon: passwordObscureText
                                                  ? Image(
                                                      image: AssetImage(
                                                          'assets/icons/hide.png'),
                                                      width: screenWidth*0.07,
                                                      height: screenHeight*0.07,
                                                    )
                                                  : Image(
                                                      image: AssetImage(
                                                          'assets/icons/view.png'),
                                                      width: screenWidth*0.07,
                                                      height: screenHeight*0.07)),
                                          hintText: 'Password',
                                          border: InputBorder.none,
                                          fillColor: black,
                                        ),
                                        autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Enter password';
                                          }else if(value == value.trim()) {
                                            return null;
                                          }else{
                                            return "password don't accept spaces";
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
                                        keyboardType: TextInputType.text,
                                        controller: ConfirmPasswordController,
                                        obscureText: confiemPasswordObscureText,
                                        decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  confiemPasswordObscureText =
                                                  !confiemPasswordObscureText;
                                                });
                                              },
                                              icon: confiemPasswordObscureText
                                                  ? Image(
                                                image: AssetImage(
                                                    'assets/icons/hide.png'),
                                                width: screenWidth*0.07,
                                                height: screenHeight*0.07,
                                              )
                                                  : Image(
                                                  image: AssetImage(
                                                      'assets/icons/view.png'),
                                                  width: screenWidth*0.07,
                                                  height: screenHeight*0.07)),
                                          hintText: 'Confirm Password',
                                          border: InputBorder.none,
                                          fillColor: black,
                                        ),
                                        autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Enter Confirm Password';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: screenHeight*0.02,
              ),
              BottomContainer(
                title: 'Sign Up',
                loading: loading,
                onTap: () {
                  // verifyOTP();
                  if (formkey.currentState!.validate()) {
                    if (passwordController.text.toString() == ConfirmPasswordController.text.toString()) {
                      SingUp();
                    } else {
                      Utils().toastMessage('check confirm password');
                    }
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
