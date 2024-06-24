import 'package:flutter/material.dart';

enum TaskStatus { todo, inProgress, done }

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    this.taskStatus = TaskStatus.todo,
  });

  final TaskStatus taskStatus;

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
                  'Do homework',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Description of the task',
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
                color: Colors.indigo),
            child: const Text('In Progress'),
          )
        ],
      ),
    );
  }
}
