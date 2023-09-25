import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:inext_assignment/Pages/Loginpage.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("iNext Assignment",
              style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'cursive',
                  color: Colors.white
              ),),
          ],
        ),
      ),
      nextScreen: LoginPage(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.blue,
      duration: 3000,
    );
  }
}
