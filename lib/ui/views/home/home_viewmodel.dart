import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todo_app/app/app.bottomsheets.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/entities/task_entity.dart';
import 'package:todo_app/services/task_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _taskService = locator<TaskService>();

  void showAddTaskSheet() {
    _bottomSheetService.showCustomSheet(variant: BottomSheetType.addTask);
  }

  void updateTaskStatus(String id, TaskStatus status) {
    _taskService.updateTaskStatus(id, status);
  }

  void deleteTask(String id) async {
    EasyLoading.show(status: 'Deleting...');
    await _taskService.deleteTask(id);
    EasyLoading.dismiss();
  }

  void showUpdateTaskSheet(TaskEntity task) async {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.updateTask,
      data: task,
    );
  }
}
