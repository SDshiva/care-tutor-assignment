import 'package:care_tutors_assignment/config/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SplashController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void checkAuthentication(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));

    User? user = _auth.currentUser;

    if (user != null) {
      context.go(Paths.HOME_SCREEN);
    } else {
      context.go(Paths.REGISTER_SCREEN);
    }
  }
}
