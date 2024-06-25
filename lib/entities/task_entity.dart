import 'package:cloud_firestore/cloud_firestore.dart';

enum TaskStatus { todo, inProgress, done, invalid }

class TaskEntity {
  String? id;
  String? title;
  String? description;
  String? status;

  TaskEntity({
    this.id,
    this.description,
    this.status,
    this.title,
  });

  TaskEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
  }

  factory TaskEntity.fromFirestore(
      QueryDocumentSnapshot<Map<String, dynamic>>? snapshot) {
    final data = snapshot?.data();
    return TaskEntity(
      id: snapshot?.id,
      title: data?['title'],
      description: data?['description'],
      status: data?['status'],
    );
  }

  TaskEntity copyWith({
    String? id,
    String? title,
    String? description,
    String? status,
  }) =>
      TaskEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        status: status ?? this.status,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['status'] = status;

    return map;
  }

  Map<String, dynamic> toFirestore() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    map['status'] = status;

    return map;
  }

  TaskStatus get taskStatus {
    switch (status) {
      case 'todo':
        return TaskStatus.todo;
      case 'in_progress':
        return TaskStatus.inProgress;
      case 'done':
        return TaskStatus.done;
      default:
        return TaskStatus.invalid;
    }
  }

  String get taskName {
    switch (taskStatus) {
      case TaskStatus.todo:
        return 'To Do';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.done:
        return 'Done';
      case TaskStatus.invalid:
        return 'Invalid';
    }
  }
}
