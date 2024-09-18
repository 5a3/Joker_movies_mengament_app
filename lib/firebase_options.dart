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
    apiKey: 'AIzaSyD-4owFYq1nxhzQ7WYQgcvTM-kr-j-xJ8U',
    appId: '1:177892531420:web:ef29ad332aed3fe1ff6819',
    messagingSenderId: '177892531420',
    projectId: 'joker-ef0ec',
    authDomain: 'joker-ef0ec.firebaseapp.com',
    storageBucket: 'joker-ef0ec.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWz9VnhgyvqoF9hhGU3fPJnyTQbaaGnGI',
    appId: '1:177892531420:android:f1cdc485b917935aff6819',
    messagingSenderId: '177892531420',
    projectId: 'joker-ef0ec',
    storageBucket: 'joker-ef0ec.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAVUolIyNcPai774n-3BesXxVhGo9Lhjyc',
    appId: '1:177892531420:ios:50b6047a958416faff6819',
    messagingSenderId: '177892531420',
    projectId: 'joker-ef0ec',
    storageBucket: 'joker-ef0ec.appspot.com',
    iosBundleId: 'com.example.joker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAVUolIyNcPai774n-3BesXxVhGo9Lhjyc',
    appId: '1:177892531420:ios:50b6047a958416faff6819',
    messagingSenderId: '177892531420',
    projectId: 'joker-ef0ec',
    storageBucket: 'joker-ef0ec.appspot.com',
    iosBundleId: 'com.example.joker',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD-4owFYq1nxhzQ7WYQgcvTM-kr-j-xJ8U',
    appId: '1:177892531420:web:0515965786ee56b2ff6819',
    messagingSenderId: '177892531420',
    projectId: 'joker-ef0ec',
    authDomain: 'joker-ef0ec.firebaseapp.com',
    storageBucket: 'joker-ef0ec.appspot.com',
  );
}
