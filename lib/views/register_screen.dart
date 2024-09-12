// ignore_for_file: prefer_const_constructors

import 'package:care_tutors_assignment/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../config/routes.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: authController.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                  labelText: "Email Address",
                  labelStyle: TextStyle(
                    color: Colors.blueAccent,
                  ),
                  prefixIcon: Icon(Icons.email, color: Colors.blueAccent),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 2.0),
                  ),
                  filled: true,
                  fillColor: Colors.blue.shade50,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                ),
                style: TextStyle(color: Colors.blue.shade700),
              ),
              SizedBox(
                height: 16,
              ),
              Obx(
                () => TextField(
                  controller: authController.passwordController,
                  obscureText: authController.isPasswordHidden.value,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: Colors.blueAccent,
                    ),
                    prefixIcon: Icon(Icons.lock, color: Colors.blueAccent),
                    suffixIcon: IconButton(
                      icon: Icon(
                        authController.isPasswordHidden.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.blueAccent,
                      ),
                      onPressed: () {
                        authController.togglePasswordVisibility();
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 2.0,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.blue.shade50,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 20.0,
                    ),
                  ),
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Obx(
                () => TextField(
                  controller: authController.confirmPasswordController,
                  obscureText: authController.isConfirmPasswordHidden.value,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(color: Colors.grey.shade500),
                    labelText: "Confirm Password",
                    labelStyle: TextStyle(
                      color: Colors.blueAccent,
                    ),
                    prefixIcon: Icon(Icons.lock, color: Colors.blueAccent),
                    suffixIcon: IconButton(
                      icon: Icon(
                        authController.isConfirmPasswordHidden.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.blueAccent,
                      ),
                      onPressed: () {
                        authController.toggleConfirmPasswordVisibility();
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          BorderSide(color: Colors.blueAccent, width: 2.0),
                    ),
                    filled: true,
                    fillColor: Colors.blue.shade50,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                  ),
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    authController.register(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                    elevation: 5.0,
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      context.push(Paths.LOGIN_SCREEN);
                    },
                    child: Text("Login!"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
