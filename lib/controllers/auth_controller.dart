import 'package:care_tutors_assignment/config/routes.dart';
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

  void register(BuildContext context) async {
    if (passwordController.text == confirmPasswordController.text) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          context.go(Paths.HOME_SCREEN);
          Get.snackbar(
            "Success",
            "Hello ${user.displayName ?? "User"}",
            snackPosition: SnackPosition.TOP,
          );
          clearController();
        }
      } catch (e) {
        Get.snackbar(
          "Error",
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      Get.snackbar(
        "Error",
        "Password do not matched!",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void clearController() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }
}
