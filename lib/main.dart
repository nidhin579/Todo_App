import 'package:flutter/material.dart';
import 'package:todo_app/app/app.bottomsheets.dart';
import 'package:todo_app/app/app.dialogs.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/ui/common/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
