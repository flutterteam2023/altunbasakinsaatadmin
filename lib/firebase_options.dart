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
    apiKey: 'AIzaSyB4M3Ou-2H9CZS77EO5ubqGWRZmrMGjBBY',
    appId: '1:817652745921:android:146ed9add251b32b7e3640',
    messagingSenderId: '817652745921',
    projectId: 'altunbasakinsaat-3be4f',
    storageBucket: 'altunbasakinsaat-3be4f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtdlwqs80peTZn5Lh6KEoGGO2gU4qJkG4',
    appId: '1:817652745921:ios:f9ffab5a72eee7ed7e3640',
    messagingSenderId: '817652745921',
    projectId: 'altunbasakinsaat-3be4f',
    storageBucket: 'altunbasakinsaat-3be4f.appspot.com',
    iosClientId: '817652745921-3519pcrbcd3vr4mm1re9rio83k2pf8ef.apps.googleusercontent.com',
    iosBundleId: 'com.example.altunbasakinsaatadmin',
  );
}
