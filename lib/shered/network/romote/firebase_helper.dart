import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper {
  Future<DocumentReference<Map<String, dynamic>>> addTask({
    required taskName,
    required taskDesc,
    required taskTag,
  }) {
    return FirebaseFirestore.instance.collection('tasks').add({
      'taskName': taskName,
      'taskDesc': taskDesc,
      'taskTag': taskTag,
    });
  }
}
