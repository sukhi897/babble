import 'package:babble/utilities.dart';
import 'package:flutter/material.dart';
import 'package:babble/widgets/rounded_button.dart';
import 'package:babble/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../widgets/custom_snackbar.dart';
import 'chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email = "";
  String password = "";

  void registerUser() async {
    setState(() {
      showSpinner = true;
    });
    try {
      if (isValidEmail(email)) {
        CustomSnackbar snackbar = CustomSnackbar(
          icon: Icons.warning,
          text:
              'Invalid Email address, please check again and enter a valid email address.',
        );
        snackbar.show(context);
      }
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (newUser != null) {
        setState(() {
          showSpinner = false;
        });
        Navigator.pushNamed(context, ChatScreen.id);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CustomSnackbar snackbar = CustomSnackbar(
          icon: Icons.warning,
          text:
              'Password is too weak. Please choose a stronger password which is harder to crack.',
        );
        snackbar.show(context);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        CustomSnackbar snackbar = CustomSnackbar(
          icon: Icons.warning,
          text:
              'Account is already registered. Please login from Login page or contact devs to reset your password.',
        );
        snackbar.show(context);
        print('The account already exists for that email.');
      }
    } catch (e) {
      print('RegistrationScreen: Failed to create new User\n');
      print(e);
    }
    setState(() {
      showSpinner = false;
    });
    //print(email);
    //print(password);
  }

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
                constraints: BoxConstraints(minWidth: 100, maxWidth: 400),
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
                        onSubmitted: (value) {
                          // called when user presses enter
                          //value is entered text after ENTER press
                          registerUser();
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
                        onSubmitted: (value) {
                          // called when user presses enter
                          //value is entered text after ENTER press
                          registerUser();
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Enter your password'),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      RoundedButton(
                        title: 'Register',
                        colour: oxfordBlue,
                        onPressed: registerUser,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
