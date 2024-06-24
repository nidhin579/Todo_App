import 'package:flutter/material.dart';
import 'package:todo_app/entities/task_entity.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    required this.task,
    super.key,
  });

  final TaskEntity task;

  String get taskStatus {
    switch (task.taskStatus) {
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

  Color get taskColor {
    switch (task.taskStatus) {
      case TaskStatus.todo:
        return Colors.indigo;
      case TaskStatus.inProgress:
        return Colors.blueAccent;
      case TaskStatus.done:
        return Colors.green;
      case TaskStatus.invalid:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: const Border(
          bottom: BorderSide(width: 2),
          left: BorderSide(),
          right: BorderSide(),
          top: BorderSide(),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title ?? '',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  task.description ?? '',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color:
                        theme.colorScheme.onPrimaryContainer.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(),
              color: taskColor,
            ),
            child: Text(
              taskStatus,
              style: theme.textTheme.titleSmall,
            ),
          )
        ],
      ),
    );
  }
}
