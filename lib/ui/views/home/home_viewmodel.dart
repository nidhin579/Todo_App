import 'package:todo_app/app/app.bottomsheets.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();



  void showAddTaskSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.addTask,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
