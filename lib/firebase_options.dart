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
    apiKey: 'AIzaSyD6bgbEnGIotfb1zt0Zcl6hZCBVOdinWjE',
    appId: '1:931905690363:web:70cad6996836e81832ae5e',
    messagingSenderId: '931905690363',
    projectId: 'marshmallow-31791',
    authDomain: 'marshmallow-31791.firebaseapp.com',
    storageBucket: 'marshmallow-31791.appspot.com',
    measurementId: 'G-98RK82HFC9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDlA5BTS5wLIe8FkxHaD1GiqIHUMs_xJTs',
    appId: '1:931905690363:android:cce3a412a3eb4b6532ae5e',
    messagingSenderId: '931905690363',
    projectId: 'marshmallow-31791',
    storageBucket: 'marshmallow-31791.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB4MdtX5w5v6sDM8c4VgR6fwSIshDcLXiM',
    appId: '1:931905690363:ios:3397b648c8ce43e132ae5e',
    messagingSenderId: '931905690363',
    projectId: 'marshmallow-31791',
    storageBucket: 'marshmallow-31791.appspot.com',
    iosClientId: '931905690363-6eva88hu0r1c8gsvh4vbvdj0lpucc3ke.apps.googleusercontent.com',
    iosBundleId: 'com.marshmallow.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB4MdtX5w5v6sDM8c4VgR6fwSIshDcLXiM',
    appId: '1:931905690363:ios:6b448cd9bc380cce32ae5e',
    messagingSenderId: '931905690363',
    projectId: 'marshmallow-31791',
    storageBucket: 'marshmallow-31791.appspot.com',
    iosClientId: '931905690363-97lktg7lof0qp03lr1el5tveordb7kbl.apps.googleusercontent.com',
    iosBundleId: 'com.example.marshmallow',
  );
}