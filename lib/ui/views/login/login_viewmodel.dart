import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/app/app.router.dart';
import 'package:todo_app/services/account_service.dart';
import 'package:todo_app/services/task_service.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _accountService = locator<AccountService>();
  final _taskService = locator<TaskService>();

  Future fetchAccountAndNavigate() async {
    // Fetch account of the user
    final fetched = await _accountService.fetchAccount();
    if (!fetched) return;
    if (!_accountService.accountExist) await _accountService.createAccount();
    _taskService.setUserId(_accountService.account?.id);
    _navigationService.replaceWithHomeView();
  }
}
