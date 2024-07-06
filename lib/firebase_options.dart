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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCqO-ow1qTks5W0bd_5z1ox5T-9_B5y3tQ',
    appId: '1:426450863157:web:c8dbe4e59b68d012e39d7c',
    messagingSenderId: '426450863157',
    projectId: 'messages-5e9bc',
    authDomain: 'messages-5e9bc.firebaseapp.com',
    databaseURL: 'https://messages-5e9bc-default-rtdb.firebaseio.com',
    storageBucket: 'messages-5e9bc.appspot.com',
    measurementId: 'G-422GY7BH3Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD4rfM1v9_CNwICLBDbJjWVYEe6CFGQZzQ',
    appId: '1:426450863157:android:c61528de413455d6e39d7c',
    messagingSenderId: '426450863157',
    projectId: 'messages-5e9bc',
    databaseURL: 'https://messages-5e9bc-default-rtdb.firebaseio.com',
    storageBucket: 'messages-5e9bc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDgE5hHAbOCqeeZuTqX4ZGbbL0vjVCPfgg',
    appId: '1:426450863157:ios:660a734d1f9e0b76e39d7c',
    messagingSenderId: '426450863157',
    projectId: 'messages-5e9bc',
    databaseURL: 'https://messages-5e9bc-default-rtdb.firebaseio.com',
    storageBucket: 'messages-5e9bc.appspot.com',
    iosClientId: '426450863157-k4dvtlmed5rq9b39oah3s9nqa6ns26d2.apps.googleusercontent.com',
    iosBundleId: 'com.example.messenger',
  );

}