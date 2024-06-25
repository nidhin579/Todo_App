import 'package:flutter/material.dart';
import 'package:todo_app/entities/task_entity.dart';
import 'package:todo_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/ui/views/home/widgets/app_button.dart';

import 'update_task_sheet_model.dart';

class UpdateTaskSheet extends StackedView<UpdateTaskSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;

  const UpdateTaskSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  void onViewModelReady(UpdateTaskSheetModel viewModel) {
    // TODO: implement onViewModelReady
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    UpdateTaskSheetModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);
    String? title = (request.data as TaskEntity).title;
    String? description = (request.data as TaskEntity).description;
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
            'Update Task',
            style: theme.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          verticalSpaceMedium,
          TextField(
            controller: TextEditingController(text: title),
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
            controller: TextEditingController(text: description),
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
            text: 'Update',
            onTap: () {
              if (title?.isNotEmpty == true &&
                  description?.isNotEmpty == true) {
                viewModel.updateTask(
                  title!,
                  description!,
                  (request.data as TaskEntity).status,
                  (request.data as TaskEntity).id!,
                );
              }
            },
          ),
          verticalSpaceMedium,
        ],
      ),
    );
  }

  @override
  UpdateTaskSheetModel viewModelBuilder(BuildContext context) =>
      UpdateTaskSheetModel();
}
