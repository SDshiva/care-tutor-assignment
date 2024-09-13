// ignore_for_file: constant_identifier_names

import 'package:care_tutors_assignment/views/add_notes_screen.dart';
import 'package:care_tutors_assignment/views/home_screen.dart';
import 'package:care_tutors_assignment/views/login_screen.dart';
import 'package:care_tutors_assignment/views/register_screen.dart';
import 'package:care_tutors_assignment/views/splash_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: Paths.SPLASH_SCREEN,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: Paths.LOGIN_SCREEN,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: Paths.REGISTER_SCREEN,
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: Paths.HOME_SCREEN,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: Paths.ADD_NOTES_SCREEN,
      builder: (context, state) => AddNotesScreen(),
    ),
  ],
);

class Paths {
  static const SPLASH_SCREEN = '/';
  static const REGISTER_SCREEN = '/register';
  static const LOGIN_SCREEN = '/login';
  static const HOME_SCREEN = '/home';
  static const ADD_NOTES_SCREEN = '/add-notes';
}
