// ignore_for_file: prefer_const_constructors

import 'package:care_tutors_assignment/config/routes.dart';
import 'package:care_tutors_assignment/controllers/auth_controller.dart';
import 'package:care_tutors_assignment/controllers/notes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final NotesController notesController = Get.put(NotesController());
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        actions: [
          IconButton(
            onPressed: () {
              authController.signOut(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: notesController.notes.length,
          itemBuilder: (context, index) {
            final note = notesController.notes[index];
            return ListTile(
              title: Text(note.title),
              subtitle: Text(
                note.description,
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(Paths.ADD_NOTES_SCREEN);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
