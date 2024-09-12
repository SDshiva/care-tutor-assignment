import 'package:care_tutors_assignment/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      context.go(Paths.LOGIN_SCREEN);
    });
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
