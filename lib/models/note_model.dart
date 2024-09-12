import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  String id;
  String title;
  String description;

  Note({
    required this.id,
    required this.title,
    required this.description,
  });

  factory Note.fromDocument(DocumentSnapshot doc) {
    return Note(
      id: doc.id,
      title: doc['title'] ?? '',
      description: doc['description'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }
}
