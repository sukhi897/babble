import 'package:flutter/material.dart';
import 'package:babble/widgets/rounded_button.dart';
import 'package:babble/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../widgets/custom_snackbar.dart';
import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: Center(
        child: showSpinner
            ? SpinKitSpinningLines(
                color: kspinnerColor,
                itemCount: 9,
              )
            : Container(
                constraints: BoxConstraints(minWidth: 100, maxWidth: 500),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Flexible(
                        child: Hero(
                          tag: 'logo',
                          child: Container(
                            height: 200.0,
                            child: Image.asset('images/babble_logo.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 48.0,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Enter your email'),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Enter your password'),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      RoundedButton(
                        title: 'Log In',
                        colour: bdazzledBlue,
                        onPressed: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          // Input Validation
                          try {
                            final userCredential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: email,
                              password: password,
                            );
                            if (userCredential != "") {
                              Navigator.pushNamed(context, ChatScreen.id);
                            }
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              CustomSnackbar snackbar = CustomSnackbar(
                                icon: Icons.account_circle_outlined,
                                text:
                                    'No user found for that email. Please check for typos or register a new account on Register screen.',
                              );
                              snackbar.show(context);
                              print('No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              CustomSnackbar snackbar = CustomSnackbar(
                                icon: Icons.warning,
                                text:
                                    'Password is Incorrect. Contact devs to reset your password.',
                              );
                              snackbar.show(context);
                              print('Wrong password provided for that user.');
                            }
                            setState(() {
                              showSpinner = false;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
