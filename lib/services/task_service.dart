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

  Future<bool> updateTask(TaskEntity task) async {
    try {
      await _tasksCollectionReference.doc(task.id).update(task.toJson());
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> updateTaskStatus(String id, TaskStatus status) async {
    try {
      String statusId = '';
      switch (status) {
        case TaskStatus.inProgress:
          statusId = 'in_progress';
        case TaskStatus.done:
          statusId = 'done';
        case TaskStatus.todo:
        case TaskStatus.invalid:
          statusId = 'todo';
      }
      await _tasksCollectionReference.doc(id).set(
        {'status': statusId},
        SetOptions(merge: true),
      );
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> deleteTask(String id) async {
    try {
      await _tasksCollectionReference.doc(id).delete();
      return true;
    } catch (_) {
      return false;
    }
  }
}
