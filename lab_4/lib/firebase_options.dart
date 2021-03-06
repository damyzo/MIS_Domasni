// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB1yHqynWs9_F9JGKRU45szgW7DCFwv-BM',
    appId: '1:560670952190:android:3ea134dda4f68987d973af',
    messagingSenderId: '560670952190',
    projectId: 'lab-4-185025',
    storageBucket: 'lab-4-185025.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC6VKSRcAhBCrYXv1J1vKgEfEv9UZgP5GU',
    appId: '1:560670952190:ios:f5b00838234ba811d973af',
    messagingSenderId: '560670952190',
    projectId: 'lab-4-185025',
    storageBucket: 'lab-4-185025.appspot.com',
    iosClientId: '560670952190-7eho1s3tjv7snttl8uhqkjlh3v6ta84l.apps.googleusercontent.com',
    iosBundleId: 'com.example.lab4',
  );
}
