// import 'dart:html';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:asu_quickcare/screens/login_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Column(
          children: [
            SizedBox(
              width: 350,
              child: Image.asset('assets/QuickCare-Full-Logo.png'),
            ),
          ],
        ),
        nextScreen: const LoginScreen(),
        splashIconSize: 350,
        duration: 4000,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.rightToLeftWithFade,
      ),
    );
  }
}
