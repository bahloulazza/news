import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:untitled/onBoarding.dart';
import 'package:untitled/style.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Color(0xFF443C68),
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Image.asset('assets/images/splash.jpg',scale: 5.0,),
            Text('welcome to our News App',style: googleTopicWhite),
        ],
      ),nextScreen: Onboarding_Screen() ,
    splashIconSize: 200,
    duration: 3000,
    splashTransition: SplashTransition.slideTransition,);
  }
}
