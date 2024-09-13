// ignore_for_file: prefer_const_constructors

import 'package:care_tutors_assignment/config/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
    );

    animationController.forward();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    animationController.dispose();
    super.onClose();
  }

  void checkAuthentication(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));

    User? user = _auth.currentUser;
    if (user != null) {
      context.go(Paths.HOME_SCREEN);
    } else {
      context.go(Paths.LOGIN_SCREEN);
    }
  }
}
