// ignore_for_file: prefer_const_constructors

import 'package:care_tutors_assignment/config/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RxBool isPasswordHidden = true.obs;
  RxBool isConfirmPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }

  Future<void> register(BuildContext context) async {
    if (passwordController.text == confirmPasswordController.text) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        // User? user = FirebaseAuth.instance.currentUser;
        User? user = userCredential.user;
        if (user != null) {
          await FirebaseFirestore.instance.collection('user').doc(user.uid).set(
            {
              'uid': user.uid,
              'createdAt': FieldValue.serverTimestamp(),
            },
          );
          showSnackBar(context, "Successful", "Login Successfully!");
          context.go(Paths.HOME_SCREEN);
          clearController();
        }
      } catch (e) {
        showSnackBar(context, "Error", e.toString());
      }
    } else {
      showSnackBar(context, "Error", "Password Unmatched!");
    }
  }

  Future<void> login(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        showSnackBar(context, "Successful", "Login Successfully!");
        context.go(Paths.HOME_SCREEN);
        print("Login Successfully!");
        clearController();
      } else {
        showSnackBar(context, "Error", "Email or Password Unmatched!");
        print("Email or Password Unmatched!");
      }
    } catch (e) {
      showSnackBar(context, "Error", e.toString());
      print(e.toString());
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      clearController();
      showSnackBar(context, "Successful", "You have been Sign Out");
      context.go(Paths.LOGIN_SCREEN);
    } catch (e) {
      showSnackBar(context, "Error", e.toString());
      print("Sign Out Failed: ${e.toString()}");
    }
  }

  void showSnackBar(BuildContext context, String title, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title: $message'),
        duration: Duration(seconds: 4),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void clearController() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }
}
