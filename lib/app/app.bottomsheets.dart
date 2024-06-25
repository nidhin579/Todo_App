// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/add_task/add_task_sheet.dart';
import '../ui/bottom_sheets/update_task/update_task_sheet.dart';

enum BottomSheetType {
  addTask,
  updateTask,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.addTask: (context, request, completer) =>
        AddTaskSheet(request: request, completer: completer),
    BottomSheetType.updateTask: (context, request, completer) =>
        UpdateTaskSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
