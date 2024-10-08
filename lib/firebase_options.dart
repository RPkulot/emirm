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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBL2rUQtz2RKc0esF2sx9o7PDGvEyh_9a0',
    appId: '1:646948376311:android:89c4baa7b317dc8ee04df2',
    messagingSenderId: '646948376311',
    projectId: 'e-irm-mobile',
    storageBucket: 'e-irm-mobile.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDl7JJ8wDULpod6s5vsI4lVWmz5QP3j6Zw',
    appId: '1:646948376311:ios:d0b105e03cbed5b3e04df2',
    messagingSenderId: '646948376311',
    projectId: 'e-irm-mobile',
    storageBucket: 'e-irm-mobile.appspot.com',
    androidClientId: '646948376311-lhc7suo5dh7rsmbdbl4hno2p5e4qv1io.apps.googleusercontent.com',
    iosClientId: '646948376311-i5e8rhjbmos1lv7acgg7jgh39imacaj4.apps.googleusercontent.com',
    iosBundleId: 'com.eirmuplb.eirmuplb',
  );
}