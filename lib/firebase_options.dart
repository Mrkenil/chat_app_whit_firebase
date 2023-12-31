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
    apiKey: 'AIzaSyAHoJkGftbfkgjIX0DXs9_AvW8jLKPuM4w',
    appId: '1:640467055523:web:93204691b6b95522cea016',
    messagingSenderId: '640467055523',
    projectId: 'chatapp-84f10',
    authDomain: 'chatapp-84f10.firebaseapp.com',
    storageBucket: 'chatapp-84f10.appspot.com',
    measurementId: 'G-EWEB54LKPG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCvZSlt9d5T-waXoxwMHoD_FtHU_6AssZI',
    appId: '1:640467055523:android:9ae0414819ad59a2cea016',
    messagingSenderId: '640467055523',
    projectId: 'chatapp-84f10',
    storageBucket: 'chatapp-84f10.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDfvA7ylKmfwqJs2XgRnSHn5TL9etN7WDk',
    appId: '1:640467055523:ios:7b44ece1e4308947cea016',
    messagingSenderId: '640467055523',
    projectId: 'chatapp-84f10',
    storageBucket: 'chatapp-84f10.appspot.com',
    iosClientId: '640467055523-4n79269l9d12v677oleq4rr7kepes497.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDfvA7ylKmfwqJs2XgRnSHn5TL9etN7WDk',
    appId: '1:640467055523:ios:0edef2e237c352ffcea016',
    messagingSenderId: '640467055523',
    projectId: 'chatapp-84f10',
    storageBucket: 'chatapp-84f10.appspot.com',
    iosClientId: '640467055523-qval844tstd9f3hderqqgg7ov5j038no.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
