import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:go_router/go_router.dart';

import '../models/note_model.dart';

class NotesController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  var notes = [].obs;
  RxBool isHomeLoading = false.obs;
  RxBool isAddNoteLoading = false.obs;

  Future<void> fetchNotes(BuildContext context) async {
    // var snapshot = await FirebaseFireStore.
    // var snapshot = await FirebaseFirestore.instance.collection('notes').get();
    // notes.value = snapshot.docs.map((doc) => Note.fromDocument(doc)).toList();
    isHomeLoading.value = true;
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String uid = user.uid;

        var snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .collection('notes')
            .get();

        notes.value =
            snapshot.docs.map((doc) => Note.fromDocument(doc)).toList();
      }
    } catch (e) {
      showSnackBar(context, "Error", "Error fetching notes: ${e.toString()}");
    }
    isHomeLoading.value = false;
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

  Future<void> addNote(BuildContext context) async {
    isAddNoteLoading.value = true;
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null &&
        titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty) {
      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('notes')
            .add({
          'title': titleController.text.trim(),
          'description': descriptionController.text.trim(),
          'createdAt': FieldValue.serverTimestamp(),
        });

        showSnackBar(context, "Successful", "Your note is added successfully");
        clearController();
      } catch (e) {
        showSnackBar(context, "Error", e.toString());
      }
    } else {
      showSnackBar(
          context, "Error", "Please add title and description correctly");
    }

    fetchNotes(context);
    isAddNoteLoading.value = false;
    context.pop();
  }

  void clearController() {
    titleController.clear();
    descriptionController.clear();
  }
}
