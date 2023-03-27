
import 'package:clay_containers/constants.dart';
import 'package:ev_project/screens/Login_Screen/Log_in.dart';
import 'package:flutter/material.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:ev_project/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import '../../components/background_desgin.dart';
import '../../utils/utils.dart';


class Forgotpassword extends StatefulWidget {
  final bool  loading;
  const Forgotpassword({Key? key,  this.loading = false}) : super(key: key);

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {

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

  void  forgot() {
    setState(() {
      loading = true;
    });
    _auth.sendPasswordResetEmail(
        email: emailController.text.toString()).then((value) {

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LogIN(),));
      Utils().toastMessage('please check your email to recover your ID');

      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
      setState(() {

        loading = false;
      });
    });
  }

  bool isEmail(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Container(
            width: screenWidth*1,
            height: screenHeight*1,
            child: Stack(
              children: [
                BackgroundDesign(back_button: true,),

                Positioned(
                  top: screenHeight*0.23,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth*0.06),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text('Hello',style: TextStyle(
                          //     fontSize: screenWidth*0.1,fontWeight: FontWeight.bold),),
                          Text('Let\'s change your password',style: TextStyle(
                              fontSize: screenWidth*0.1,
                              color: black,
                              fontWeight: FontWeight.bold),),
                          SizedBox(height: screenHeight*0.03,),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: screenHeight*0.03),
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
                                        padding: EdgeInsets.symmetric(horizontal: screenWidth*0.08),
                                        child: TextFormField(
                                          keyboardType: TextInputType.emailAddress,
                                          controller:emailController,
                                          decoration: InputDecoration(
                                            hintText: 'Email',
                                            border: InputBorder.none,
                                            fillColor: black,
                                          ),
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                              return "email don't accept spaces";
                                            }
                                          },
                                        ),
                                      ) ,

                                    ),
                                  ),
                                  SizedBox(height: screenHeight*0.02,),

                                ],
                              ),
                            ),
                          ),
                        ]
                    ),
                  ),
                ),
                Positioned(
                  bottom: screenHeight*0.09,
                  left: 0,
                  right: 0,
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(height: screenHeight*0.07,),
                        InkWell(
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                            }
                          },
                          child: ClayContainer(
                            color: white,
                            depth: 20,
                            borderRadius: 30,
                            curveType: CurveType.convex,
                            child: Padding(
                              padding:   EdgeInsets.symmetric(vertical: screenHeight*0.02,
                                  horizontal:screenWidth*0.17 ),
                              child: widget.loading ? CircularProgressIndicator(color: black,) :
                              Text('Recover',style: TextStyle(
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
      ),
    );
  }
}
