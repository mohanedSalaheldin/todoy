import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_with_firebase_08oct/models/task_model.dart';

class FirebaseHelper {
  //create task
  static Future addTask({
    required taskName,
    required taskDesc,
    required taskTag,
  }) {
    return FirebaseFirestore.instance.collection('tasks').add({
      'taskName': taskName,
      'taskDesc': taskDesc,
      'taskTag': taskTag,
    }).then((value) {
      FirebaseFirestore.instance
          .collection('tasks')
          .doc(value.id)
          .update({'taskId': value.id});
    });
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getTasks() {
    return FirebaseFirestore.instance.collection('tasks').snapshots();
  }

  static Future<void> updateTask({required TaskModel model}) {
    return FirebaseFirestore.instance
        .collection('tasks')
        .doc(model.taskId)
        .update({
      'taskName': model.taskName,
      'taskTag': model.taskTag,
      'taskDesc': model.taskDesc,
      'taskId': model.taskId,
    });
  }

  static Future<void> deleteTask({required taskId}) {
    return FirebaseFirestore.instance.collection('tasks').doc(taskId).delete();
  }
}
