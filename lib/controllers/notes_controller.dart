import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../models/note_model.dart';

class NotesController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  var notes = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchNotes();
  }

  Future<void> fetchNotes() async {
    // var snapshot = await FirebaseFireStore.
    var snapshot = await FirebaseFirestore.instance.collection('notes').get();
    notes.value = snapshot.docs.map((doc) => Note.fromDocument(doc)).toList();
  }

  Future<void> addNote(BuildContext context) async {
    await FirebaseFirestore.instance.collection('notes').add({
      'title': titleController.text.trim(),
      'description': descriptionController.text.trim()
    });

    fetchNotes();
    context.pop();
  }
}
