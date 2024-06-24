import 'package:flutter/material.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onTap,
    required this.text,
  });

  final VoidCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: screenWidth(context) * 0.5,
      child: MaterialButton(
        color: theme.colorScheme.onSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            text,
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.surface,
            ),
          ),
        ),
      ),
    );
  }
}
