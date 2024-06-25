import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/app/app.dialogs.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/entities/task_entity.dart';
import 'package:todo_app/services/task_service.dart';

class UpdateTaskSheetModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _taskService = locator<TaskService>();
  final _navigatorService = locator<NavigationService>();

  void updateTask(
    String title,
    String description,
    String? status,
    String id,
  ) async {
    if (title.isEmpty) {
      showDialog('Title should not be empty.');
      return;
    }
    EasyLoading.show(status: 'Updating...');
    bool success = await _taskService.updateTask(TaskEntity(
      title: title,
      description: description,
      status: status,
      id: id,
    ));
    _navigatorService.back();
    EasyLoading.dismiss();
    showDialog(success ? 'Task updated successfully!' : 'Something went wrong');
  }

  void showDialog(String message) {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: message,
    );
  }
}
