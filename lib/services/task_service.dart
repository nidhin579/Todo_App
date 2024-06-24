import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/entities/task_entity.dart';

class TaskService {
  final _tasksCollectionReference =
      FirebaseFirestore.instance.collection('tasks');

  Future<bool> addTask(TaskEntity task) async {
    try {
      await _tasksCollectionReference.add(task.toJson());
      return true;
    } catch (_) {
      return false;
    }
  }
}
