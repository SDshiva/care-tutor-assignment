// ignore_for_file: prefer_const_constructors

import 'package:care_tutors_assignment/config/routes.dart';
import 'package:care_tutors_assignment/controllers/auth_controller.dart';
import 'package:care_tutors_assignment/controllers/notes_controller.dart';
import 'package:care_tutors_assignment/utils/note_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final AuthController authController = Get.put(AuthController());
  final NotesController notesController = Get.put(NotesController());

  @override
  Widget build(BuildContext context) {
    notesController.fetchNotes(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User's Notes",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            letterSpacing: 3,
          ),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue.shade200,
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
        if (notesController.isHomeLoading.value ||
            authController.isLogoutLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: notesController.notes.length,
            itemBuilder: (context, index) {
              final note = notesController.notes[index];
              return NoteCard(note: note);
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        heroTag: "Add Note",
        backgroundColor: Colors.blueAccent.shade200,
        onPressed: () {
          context.push(Paths.ADD_NOTES_SCREEN);
        },
        shape: CircleBorder(),
        elevation: 5,
        tooltip: "Add Note",
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
