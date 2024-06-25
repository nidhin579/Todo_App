import 'package:flutter/material.dart';
import 'package:stacked_services/src/models/overlay_request.dart';
import 'package:stacked_services/src/models/overlay_response.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/ui/views/home/widgets/widgets.dart';
import 'add_task_sheet_model.dart';

class AddTaskSheet extends StackedView<AddTaskSheetModel> {
  const AddTaskSheet(
      {Key? key,
      required SheetRequest request,
      required void Function(SheetResponse response) completer})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddTaskSheetModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    String title = '';
    String description = '';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add Task',
            style: theme.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          verticalSpaceMedium,
          TextField(
            decoration: InputDecoration(
              hintText: 'Title',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: (v) {
              title = v;
            },
          ),
          const SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              hintText: 'Description',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: (v) {
              description = v;
            },
          ),
          verticalSpaceMedium,
          AppButton(
            text: 'Add',
            onTap: () => viewModel.addTask(title, description),
          ),
          verticalSpaceMedium,
        ],
      ),
    );
  }

  @override
  AddTaskSheetModel viewModelBuilder(BuildContext context) =>
      AddTaskSheetModel();
}
