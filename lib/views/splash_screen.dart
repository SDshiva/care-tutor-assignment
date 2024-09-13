// ignore_for_file: prefer_const_constructors

import 'package:care_tutors_assignment/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    splashController.checkAuthentication(context);
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          alignment: Alignment.center,
          scale: splashController.animation,
          // opacity: splashController.animation,
          child: Text(
            "Care Tutor Apps",
            style: TextStyle(
              fontSize: 40,
              color: Colors.blue.shade500,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
