import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../models/note_model.dart';

class NotesController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  var notes = [].obs;

  Future<void> fetchNotes(BuildContext context) async {
    // var snapshot = await FirebaseFireStore.
    // var snapshot = await FirebaseFirestore.instance.collection('notes').get();
    // notes.value = snapshot.docs.map((doc) => Note.fromDocument(doc)).toList();

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
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('notes')
          .add({
        'title': titleController.text.trim(),
        'description': descriptionController.text.trim()
      });
    }

    fetchNotes(context);
    context.pop();
  }
}
