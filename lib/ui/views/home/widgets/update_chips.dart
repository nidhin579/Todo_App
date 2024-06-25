import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/entities/task_entity.dart';
import 'package:todo_app/ui/views/home/home_viewmodel.dart';

class UpdateChips extends ViewModelWidget<HomeViewModel> {
  const UpdateChips({
    super.key,
    required this.task,
  });

  final TaskEntity task;

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Row(
      children: [
        _Chip(
          icon: Icons.edit,
          color: Colors.indigoAccent,
          onTap: ()=>viewModel.showUpdateTaskSheet(task),
        ),
        _Chip(
          icon: Icons.delete,
          color: Colors.red,
          onTap: () => viewModel.deleteTask(task.id!),
        ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.icon,
    required this.color,
    this.onTap,
  });

  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: const Border(
            bottom: BorderSide(width: 2),
            left: BorderSide(),
            right: BorderSide(),
            top: BorderSide(),
          ),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
