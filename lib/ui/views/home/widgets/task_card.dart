import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/entities/task_entity.dart';
import 'package:todo_app/ui/views/home/widgets/update_chips.dart';
import 'widgets.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    required this.task,
    this.isOpen = false,
    super.key,
  });

  final TaskEntity task;
  final bool isOpen;

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
    final ExpandableController controller =
        ExpandableController(initialExpanded: isOpen);
    final theme = Theme.of(context);
    return ExpandablePanel(
      controller: controller,
      theme: const ExpandableThemeData(
        hasIcon: false,
        useInkWell: false,
      ),
      header: Container(
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
                color: taskColor.withOpacity(0.5),
              ),
              child: Text(
                task.taskName,
                style: theme.textTheme.titleSmall,
              ),
            )
          ],
        ),
      ),
      collapsed: const SizedBox(),
      expanded: task.id != null
          ? Row(
              children: [
                Expanded(
                  child: StatusChips(
                    id: task.id!,
                    selectedStatus: task.taskStatus,
                  ),
                ),
                UpdateChips(task: task),
              ],
            )
          : const SizedBox(),
    );
  }
}
