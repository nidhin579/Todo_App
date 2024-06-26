import 'package:todo_app/ui/bottom_sheets/add_task/add_task_sheet.dart';
import 'package:todo_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:todo_app/ui/views/home/home_view.dart';
import 'package:todo_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/services/task_service.dart';
import 'package:todo_app/ui/bottom_sheets/update_task/update_task_sheet.dart';
import 'package:todo_app/ui/views/login/login_view.dart';
import 'package:todo_app/services/account_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: TaskService),
    LazySingleton(classType: AccountService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: AddTaskSheet),
    StackedBottomsheet(classType: UpdateTaskSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
