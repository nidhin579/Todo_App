import 'package:flutter/material.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MaterialButton(
      color: theme.colorScheme.onSurface,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Add Task',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.surface,
              ),
            ),
            const SizedBox(width: 6),
            Icon(
              Icons.add_circle,
              size: 22,
              color: theme.colorScheme.surface,
            )
          ],
        ),
      ),
    );
  }
}
