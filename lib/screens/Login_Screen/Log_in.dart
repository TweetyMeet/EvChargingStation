import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:ev_project/constants/constants.dart';
import 'package:ev_project/screens/forgotpassword/forgot_pass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Bottom_Nav_Bar()));
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
                const BackgroundDesign(back_button: false,),
                Positioned(
              top: screenHeight*0.23,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.all(screenWidth*0.06),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello',style: TextStyle(
                          fontSize: screenWidth*0.1,fontWeight: FontWeight.bold),),
                      Text('Let\'s get started',style: TextStyle(
                          fontSize: screenWidth*0.05,
                          color: black.withOpacity(0.6),
                          fontWeight: FontWeight.w800),),
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
                                      controller:emailController ,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
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
                              Container(
                                child: ClayContainer(
                                  color: white,
                                  borderRadius: 30,
                                  depth: -30,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: screenWidth*0.08),
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
                                              image: const AssetImage(
                                                  'assets/icons/hide.png'),
                                              width: screenWidth*0.07,
                                              height: screenHeight*0.07,
                                            )
                                                : Image(
                                                image: const AssetImage(
                                                    'assets/icons/view.png'),
                                                width: screenWidth*0.07,
                                                height: screenHeight*0.07)),
                                        hintText: 'Password',
                                        border: InputBorder.none,
                                        fillColor: black,
                                      ),
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      validator: (value){
                                        if(value!.isEmpty){
                                          return 'Enter password';
                                        }else if(value == value.trim()) {
                                          return null;
                                        }else{
                                          return "password don't accept spaces";
                                        }
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
                        padding: EdgeInsets.only(top: screenHeight*0.02,left: screenWidth*0.02),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Forgotpassword() ));
                          },
                          child: Text('Forgot Password?',style: TextStyle(
                              fontSize: screenWidth*0.045,
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
              bottom: screenHeight*0.03,
              left: 0,
              right: 0,
              child: Container(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          login();
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
                          child: widget.loading ? const CircularProgressIndicator(color: black,) :
                          Text('Log In',style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: screenWidth*0.047
                          ),),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight*0.02,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       const Text("Don't have an account?",style: TextStyle(color: black),),
                        TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp() ));
                        },
                            child: const Text('Sign Up',style: TextStyle(color: black),)
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
