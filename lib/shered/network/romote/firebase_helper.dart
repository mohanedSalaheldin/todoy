import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper {
  //create task
  static Future<DocumentReference<Map<String, dynamic>>> addTask({
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

  static Stream<QuerySnapshot<Map<String, dynamic>>> getTasks() {
    return FirebaseFirestore.instance.collection('tasks').snapshots();
  }
}
