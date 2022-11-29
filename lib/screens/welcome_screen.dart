import 'package:babble/constants.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:babble/widgets/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor, //animation.value,
      body: Center(
        child: Container(
          constraints: BoxConstraints(minWidth: 100, maxWidth: 500),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                      child: Container(
                        child: Image.asset('images/babble_logo.png'),
                        height: 60.0,
                      ),
                    ),
                    AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Babble Chat',
                          textStyle: TextStyle(
                            fontSize: 38.0,
                            fontWeight: FontWeight.w900,
                          ),
                          speed: const Duration(milliseconds: 50),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 48.0,
                ),
                RoundedButton(
                  title: 'Log In',
                  colour: bdazzledBlue,
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
                RoundedButton(
                  title: 'Register',
                  colour: oxfordBlue,
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
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
