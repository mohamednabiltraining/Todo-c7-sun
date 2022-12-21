import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_c7_sun/database/task.dart';

class MyDataBase {
  static CollectionReference<Task> getTasksCollection() {
    return FirebaseFirestore.instance.collection('tasks').withConverter<Task>(
        fromFirestore: ((snapshot, _) => Task.fromFireStore(snapshot.data()!)),
        toFirestore: (task, _) => task.toFireStore());
  }

  static Future<void> insertTask(Task task) {
    var docReference = getTasksCollection().doc();
    task.id = docReference.id;
    return docReference.set(task);
  }
}
