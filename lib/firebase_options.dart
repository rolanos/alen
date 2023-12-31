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
    apiKey: 'AIzaSyBI_vOooPgLdnqZZdy63YRpk2IqgJyb3lc',
    appId: '1:470748637108:web:9ffc89032dbbbefb77f4e1',
    messagingSenderId: '470748637108',
    projectId: 'alen-application-20-875',
    authDomain: 'alen-application-20-875.firebaseapp.com',
    databaseURL: 'https://alen-application-20-875-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'alen-application-20-875.appspot.com',
    measurementId: 'G-GGTDFG8QKS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCUvAOc0O27t3VkJUcxcmLjyU740e_mMrc',
    appId: '1:470748637108:android:e5c28493fa4e94b977f4e1',
    messagingSenderId: '470748637108',
    projectId: 'alen-application-20-875',
    databaseURL: 'https://alen-application-20-875-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'alen-application-20-875.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyADoJc33JRqljpHvbalkVDNe3i9nUBiJwg',
    appId: '1:470748637108:ios:86ffe0369870d58c77f4e1',
    messagingSenderId: '470748637108',
    projectId: 'alen-application-20-875',
    databaseURL: 'https://alen-application-20-875-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'alen-application-20-875.appspot.com',
    iosBundleId: 'com.example.alen',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyADoJc33JRqljpHvbalkVDNe3i9nUBiJwg',
    appId: '1:470748637108:ios:6a707efecdbd69e977f4e1',
    messagingSenderId: '470748637108',
    projectId: 'alen-application-20-875',
    databaseURL: 'https://alen-application-20-875-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'alen-application-20-875.appspot.com',
    iosBundleId: 'com.example.alen.RunnerTests',
  );
}
