import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/entities/task_entity.dart';
import 'package:todo_app/ui/views/home/home_viewmodel.dart';

class StatusChips extends ViewModelWidget<HomeViewModel> {
  const StatusChips({
    super.key,
    this.selectedStatus = TaskStatus.todo,
    required this.id,
  });

  final TaskStatus selectedStatus;
  final String id;

  String taskName(TaskStatus taskStatus) {
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

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Wrap(
      children: List.generate(
        TaskStatus.values.length - 1,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
          child: InkWell(
            onTap: () =>
                viewModel.updateTaskStatus(id, TaskStatus.values[index]),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: TaskStatus.values[index] == selectedStatus
                    ? Colors.blue.withOpacity(0.5)
                    : null,
                borderRadius: BorderRadius.circular(12),
                border: const Border(
                  bottom: BorderSide(width: 2),
                  left: BorderSide(),
                  right: BorderSide(),
                  top: BorderSide(),
                ),
              ),
              child: Text(
                taskName(TaskStatus.values[index]),
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
