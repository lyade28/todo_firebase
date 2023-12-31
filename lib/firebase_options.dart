// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBacizNvOtxFMyPpIOU2t6Gbl2JdhkJdvk',
    appId: '1:6805349237:web:4518417d755136f316293c',
    messagingSenderId: '6805349237',
    projectId: 'todo-75a23',
    authDomain: 'todo-75a23.firebaseapp.com',
    storageBucket: 'todo-75a23.appspot.com',
    measurementId: 'G-FJ7PNGPBES',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAtd0j4Vf4258YbgjJVa6bvOE2QTCQkqhU',
    appId: '1:6805349237:android:cfb369c11a01249f16293c',
    messagingSenderId: '6805349237',
    projectId: 'todo-75a23',
    storageBucket: 'todo-75a23.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBNihnvPRenC9zgv0zOHXTyb59O1NqZk2Y',
    appId: '1:6805349237:ios:4e0493533a74123516293c',
    messagingSenderId: '6805349237',
    projectId: 'todo-75a23',
    storageBucket: 'todo-75a23.appspot.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBNihnvPRenC9zgv0zOHXTyb59O1NqZk2Y',
    appId: '1:6805349237:ios:61ecdd6ee3875af216293c',
    messagingSenderId: '6805349237',
    projectId: 'todo-75a23',
    storageBucket: 'todo-75a23.appspot.com',
    iosBundleId: 'com.example.todoApp.RunnerTests',
  );
}
