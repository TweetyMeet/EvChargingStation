import 'package:clay_containers/widgets/clay_container.dart';
import 'package:ev_project/constants/constants.dart';
import 'package:ev_project/screens/homescreen/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/background_desgin.dart';
import '../../components/bottomcontainer.dart';
import '../../utils/utils.dart';




class LogIN extends StatefulWidget {
  const LogIN({Key? key}) : super(key: key);

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
  void  Login() {
    setState(() {
      loading = true;
    });
    _auth.signInWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString()).then((value) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(),));
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
      setState(() {
        passwordController.clear();
        loading = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: ()async{
         SystemNavigator.pop();
         return true;
      },
      child: Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                BackgroundDesign(),
                Positioned(
              top: size.height*0.3,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.all(appPadding),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello',style: TextStyle(
                          fontSize: 35,fontWeight: FontWeight.bold),),
                      Text('Let\'s get started',style: TextStyle(
                          fontSize: 20,
                          color: black.withOpacity(0.6),
                          fontWeight: FontWeight.w800),),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: appPadding),
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
                                    padding: const EdgeInsets.symmetric(horizontal: appPadding),
                                    child: TextFormField(

                                      controller:emailController ,
                                      decoration: InputDecoration(
                                        hintText: 'Email',
                                        border: InputBorder.none,
                                        fillColor: black,
                                      ),
                                      validator: (value){
                                        if(value!.isEmpty){
                                          return 'Enter email';
                                        }
                                        return null;
                                      },
                                    ),
                                  ) ,

                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                child: ClayContainer(
                                  color: white,
                                  borderRadius: 30,
                                  depth: -30,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: appPadding),
                                    child: TextFormField(
                                      keyboardType: TextInputType.text,
                                      controller: passwordController,
                                      obscureText: true,
                                      decoration: InputDecoration(
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
                        padding: const EdgeInsets.only(top: appPadding /2),
                        child: Text('Forgot Password?',style: TextStyle(
                            fontSize: 15,
                            color: black.withOpacity(0.6),
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline
                        ),),
                      ),

                    ]
                ),
              ),
            ),

                BottomContainer(title: 'Log In', onTap: () {
                  if(formkey.currentState!.validate()){

                    Login();

                  }

                }, subtitle: 'Sign In', account: "Don't have an account?",),

              ],
            ),
          ),
        ),

      ),
    );
  }
}
