import 'package:clay_containers/widgets/clay_container.dart';
import 'package:ev_project/constants/constants.dart';
import 'package:ev_project/screens/Login_Screen/Log_in.dart';
import 'package:ev_project/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/background_desgin.dart';
import '../../components/bottomcontainer.dart';






class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool loading = false;
  final formkey = GlobalKey<FormState>();
  final emailController  = TextEditingController();
  final passwordController  = TextEditingController();
  final emailfocusnode  = FocusNode();
  final passwordfocusnode = FocusNode();
  FirebaseAuth _auth = FirebaseAuth.instance;

   @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
  }
  void  signup() {
    setState(() {
      loading = true;
    });
    _auth.createUserWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString()).then((value) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => LogIN(),));
      setState(() {
        loading = false;
      });
    })
        .onError((error, stackTrace) {
      Utils().toastMessage(error.toString().substring(30));
      setState(() {
        loading = false;
      });
    });
  }


  var errorValu = "Enter email";

      @override
      Widget build(BuildContext context) {
        Size size = MediaQuery
            .of(context)
            .size;
        return Scaffold(
          backgroundColor: white,
          body: SingleChildScrollView(
            child: Container(
              width: size.width.w,
              height: size.height.h,
              child: Stack(
                children: [
                  BackgroundDesign(back_button: false,),
                  Positioned(
                    top: size.height * 0.3.h,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.all(appPadding).w,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Hello', style: TextStyle(
                                fontSize: 35.sp, fontWeight: FontWeight.bold),),
                            Text('Let\'s get started', style: TextStyle(
                                fontSize: 20.sp,
                                color: black.withOpacity(0.6),
                                fontWeight: FontWeight.w800),),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: appPadding).r,
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: appPadding).r,
                                          child: TextFormField(
                                            keyboardType: TextInputType.emailAddress,
                                            // onChanged: (value) {
                                            //   setState(() {
                                            //     if(value.contains("")){
                                            //       errorValu = "Enter email";
                                            //     }else{
                                            //       errorValu = "";
                                            //     }
                                            //   });
                                            // },
                                            controller: emailController,
                                            focusNode: emailfocusnode,
                                            onFieldSubmitted: (value){
                                                Utils.fieldFocus(context,emailfocusnode , passwordfocusnode);
                                            },
                                            decoration: InputDecoration(
                                              // errorText: errorValu.isEmpty? errorValu : null,
                                              hintText: 'Email',
                                              border: InputBorder.none,
                                              fillColor: black,
                                            ),
                                            validator: (value) {
                                               if (value!.isEmpty) {
                                                 return  'Enter email';
                                               }else {
                                                 return null;
                                               }
                                            },
                                          ),
                                        ),

                                      ),
                                    ),
                                    SizedBox(height: 10.h,),
                                    Container(
                                      child: ClayContainer(
                                        color: white,
                                        borderRadius: 30.r,
                                        depth: -30,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: appPadding).r,
                                          child: TextFormField(
                                            keyboardType: TextInputType.text,
                                            controller: passwordController,
                                            focusNode: passwordfocusnode,
                                            onFieldSubmitted: (value){

                                            },
                                            obscureText: true,
                                            decoration: InputDecoration(
                                              hintText: 'Password',
                                              border: InputBorder.none,
                                              fillColor: black,
                                            ),
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Enter password';
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
                          ]
                      ),
                    ),
                  ),

                  BottomContainer(title: 'Sign Up',
                    loading: loading,
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        signup();
                      }
                    }, subtitle: 'Log IN', account: 'Already have an account?',),
                ],
              ),
            ),
          ),

        );
      }
    }


