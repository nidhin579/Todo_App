import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/app/app.dialogs.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/entities/task_entity.dart';
import 'package:todo_app/services/task_service.dart';

class AddTaskSheetModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _taskService = locator<TaskService>();
  final _navigatorService = locator<NavigationService>();

  void addTask(String title, String description) async {
    EasyLoading.show(status: 'Adding...');
    bool success = await _taskService.addTask(TaskEntity(
      title: title,
      description: description,
      status: 'todo',
    ));
    _navigatorService.back();
    EasyLoading.dismiss();
    showDialog(success ? 'Task added successfully!' : 'Something went wrong');
  }

  void showDialog(String message) {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: message,
    );
  }
}
