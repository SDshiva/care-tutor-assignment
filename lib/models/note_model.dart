import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  String id;
  String title;
  String description;
  DateTime? createdAt;

  Note({
    required this.id,
    required this.title,
    required this.description,
    this.createdAt,
  });

  factory Note.fromDocument(DocumentSnapshot doc) {
    return Note(
      id: doc.id,
      title: doc['title'] ?? '',
      description: doc['description'] ?? '',
      createdAt: (doc['createdAt'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }
}
