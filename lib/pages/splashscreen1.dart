import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ponpescondong/pages/splashscreen2.dart';

class Splashscreen1 extends StatelessWidget {
  const Splashscreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/welcome.json'),
      splashIconSize: double.maxFinite,
      splashTransition: SplashTransition.fadeTransition,
      nextScreen: const Splashscreen2(),
    );
  }
}
