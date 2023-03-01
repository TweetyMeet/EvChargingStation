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
  final emailfocusnode = FocusNode();
  final passwordfocusnode = FocusNode();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  void signup() {
    setState(() {
      loading = true;
    });
    _auth
        .createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((value) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => email_verifying_screen(),
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

  bool passwordObscureText = true;
  bool confiemPasswordObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Container(
          width: 400.w,
          height: 750.h,
          child: Stack(
            children: [
              BackgroundDesign(
                back_button: false,
              ),
              Positioned(
                top: 200.h,
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Enter email';
                                          } else {
                                            return null;
                                          }
                                        },
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
                                                width: 25.w,
                                                height: 25.h,
                                              )
                                                  : Image(
                                                  image: AssetImage(
                                                      'assets/icons/view.png'),
                                                  width: 25.w,
                                                  height: 25.h)),
                                          hintText: 'Confirm Password',
                                          border: InputBorder.none,
                                          fillColor: black,
                                        ),
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
              BottomContainer(
                title: 'Sign Up',
                loading: loading,
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    if (passwordController.text.toString() ==
                        ConfirmPasswordController.text.toString()) {
                      signup();
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
