import 'package:care_tutors_assignment/controllers/notes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNotesScreen extends StatelessWidget {
  AddNotesScreen({super.key});

  final NotesController notesController = Get.put(NotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: notesController.titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: notesController.descriptionController,
              decoration: InputDecoration(labelText: "Description"),
            ),
            SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  notesController.addNote(context);
                },
                child: Text("Save Note")),
          ],
        ),
      ),
    );
  }
}
