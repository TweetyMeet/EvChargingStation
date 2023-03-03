import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:ev_project/constants/constants.dart';
import 'package:ev_project/screens/forgotpassword/forgot_pass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/background_desgin.dart';
import '../../components/bottomcontainer.dart';
import '../../utils/utils.dart';
import '../Sign_Up/SignUP.dart';
import '../../Bottom_Nav_Bar/bottom_nav_bar.dart';
import '../homescreen/homescreen.dart';


class LogIN extends StatefulWidget {
  final bool  loading;
  const LogIN({Key? key, this.loading = false}) : super(key: key);

  @override
  State<LogIN> createState() => _LogINState();
}

class _LogINState extends State<LogIN> {
  bool loading = false;
  final formkey = GlobalKey<FormState>();
  final emailController  = TextEditingController();
  final passwordController  = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
  }

  void  login() {
    setState(() {
      loading = true;
    });
    _auth.signInWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString()).then((value) {

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Bottom_Nav_Bar(),));
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      var s1 = error.toString().split(']');
      Utils().toastMessage(s1[1].toString());
      setState(() {
        passwordController.clear();
        loading = false;
      });
    });
  }

  bool passwordObscureText = true;

  bool isEmail(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
         SystemNavigator.pop();
         return true;
      },
      child: Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Container(
            width: 400.w,
            height: 750.h,
            child: Stack(

              children: [
                BackgroundDesign(back_button: false,),
                Positioned(
              top: 170.h,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.all(appPadding).w,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello',style: TextStyle(
                          fontSize: 35.sp,fontWeight: FontWeight.bold),),
                      Text('Let\'s get started',style: TextStyle(
                          fontSize: 20.sp,
                          color: black.withOpacity(0.6),
                          fontWeight: FontWeight.w800),),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: appPadding).r,
                        child: Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: formkey,
                          child: Column(
                            children: [
                              Container(
                                child: ClayContainer(
                                  color: white,
                                  borderRadius: 30.r,
                                  depth: -30,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: appPadding).r,
                                    child: TextFormField(
                                      controller:emailController ,
                                      decoration: InputDecoration(
                                        hintText: 'Email',
                                        border: InputBorder.none,
                                        fillColor: black,
                                      ),

                                      validator: (value){
                                        if (value!.isEmpty) {
                                          return 'Enter email';
                                        } else if(value == value.trim()) {
                                          if (isEmail(value)) {
                                            return null;
                                          } else {
                                            return 'Enter valid email';
                                          }
                                        }else {
                                          return 'Enter valid email';
                                        }
                                      },
                                    ),
                                  ) ,

                                ),
                              ),
                              SizedBox(height: 10.h,),
                              Container(
                                child: ClayContainer(
                                  color: white,
                                  borderRadius: 30.r,
                                  depth: -30,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: appPadding).r,
                                    child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      controller: passwordController,
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
                                              width: 25.w,
                                              height: 25.h,
                                            )
                                                : Image(
                                                image: AssetImage(
                                                    'assets/icons/view.png'),
                                                width: 25.w,
                                                height: 25.h)),
                                        hintText: 'Password',
                                        border: InputBorder.none,
                                        fillColor: black,
                                      ),
                                      validator: (value){
                                        if(value!.isEmpty){
                                          return 'Enter password';
                                        }
                                        return null;

                                      },
                                    ),
                                  ) ,

                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: appPadding / 2,left: 10).r,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Forgotpassword() ));
                          },
                          child: Text('Forgot Password?',style: TextStyle(
                              fontSize: 15.sp,
                              color: black.withOpacity(0.6),
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline
                          ),),
                        ),
                      ),

                    ]
                ),
              ),
            ),

            Positioned(
              bottom: 65.h,
              left: 0,
              right: 0,
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 10.h,),
                    InkWell(
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          login();
                        }
                      },
                      child: ClayContainer(
                        color: white,
                        depth: 40,
                        borderRadius: 30.r,
                        curveType: CurveType.convex,
                        child: Padding(
                          padding:   EdgeInsets.symmetric(vertical: appPadding/2,
                              horizontal:appPadding *2).r,
                          child: widget.loading ? CircularProgressIndicator(color: black,) :
                          Text('Log In',style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 17.sp
                          ),),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",style: TextStyle(color: black),),
                        TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp() ));
                        },
                            child: Text('Sign Up',style: TextStyle(color: black),)
                        ),
                      ],
                    ),
                  ],
                ),

              ),
            ),

              ],
            ),
          ),
        ),

      ),
    );
  }
}
