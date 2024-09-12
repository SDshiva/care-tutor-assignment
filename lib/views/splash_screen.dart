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
        child: Text(
          "Care Tutor Apps",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
