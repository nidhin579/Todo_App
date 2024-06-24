// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB794iYW_Hkk1oWVlI3ZDm2tu93a-hKJXE',
    appId: '1:978126618952:web:7f72d86a808695c61eb37d',
    messagingSenderId: '978126618952',
    projectId: 'todo-app-ea5d8',
    authDomain: 'todo-app-ea5d8.firebaseapp.com',
    storageBucket: 'todo-app-ea5d8.appspot.com',
    measurementId: 'G-B5JN9JK8FY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyABiI_xZRFeQrmeksODnyNbrfSZ0vyDEFQ',
    appId: '1:978126618952:android:b240034cc0b6ffc81eb37d',
    messagingSenderId: '978126618952',
    projectId: 'todo-app-ea5d8',
    storageBucket: 'todo-app-ea5d8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAUIflDxUSZPU-_uF-HSEHbHjq2_yCNq6A',
    appId: '1:978126618952:ios:bf4e33eff526c2511eb37d',
    messagingSenderId: '978126618952',
    projectId: 'todo-app-ea5d8',
    storageBucket: 'todo-app-ea5d8.appspot.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAUIflDxUSZPU-_uF-HSEHbHjq2_yCNq6A',
    appId: '1:978126618952:ios:bf4e33eff526c2511eb37d',
    messagingSenderId: '978126618952',
    projectId: 'todo-app-ea5d8',
    storageBucket: 'todo-app-ea5d8.appspot.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB794iYW_Hkk1oWVlI3ZDm2tu93a-hKJXE',
    appId: '1:978126618952:web:daf1a2c3b3bfd1161eb37d',
    messagingSenderId: '978126618952',
    projectId: 'todo-app-ea5d8',
    authDomain: 'todo-app-ea5d8.firebaseapp.com',
    storageBucket: 'todo-app-ea5d8.appspot.com',
    measurementId: 'G-G3WGP1X5MN',
  );
}
