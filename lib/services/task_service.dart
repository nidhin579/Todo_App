import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/entities/task_entity.dart';
import 'package:todo_app/ui/views/home/home_viewmodel.dart';

class TaskService {
  String? userId;
  CollectionReference<Map<String, dynamic>>? _tasksCollectionReference;

  void setUserId(String? userId) {
    this.userId = userId;
    _tasksCollectionReference = FirebaseFirestore.instance
        .collection('accounts')
        .doc(userId)
        .collection('tasks');
  }

  Query<Map<String, dynamic>> getTaskCollectionReference(FilterType filter) {
    Query<Map<String, dynamic>> reference = FirebaseFirestore.instance
        .collection('accounts')
        .doc(userId)
        .collection('tasks');

    switch (filter) {
      case FilterType.all:
        break;
      case FilterType.todo:
        reference = reference.where('status', isEqualTo: 'todo');
        break;
      case FilterType.inProgress:
        reference = reference.where('status', isEqualTo: 'in_progress');
        break;
      case FilterType.done:
        reference = reference.where('status', isEqualTo: 'done');
        break;
    }
    return reference;
  }

  Future<bool> addTask(TaskEntity task) async {
    try {
      await _tasksCollectionReference?.add(task.toJson());
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> updateTask(TaskEntity task) async {
    try {
      await _tasksCollectionReference?.doc(task.id).update(task.toJson());
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
      await _tasksCollectionReference?.doc(id).set(
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
      await _tasksCollectionReference?.doc(id).delete();
      return true;
    } catch (_) {
      return false;
    }
  }
}
