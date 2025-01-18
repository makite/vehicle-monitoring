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
    apiKey: 'AIzaSyCk9UBcjs1noh2cbQxLqXhMn6sr6SIURnc',
    appId: '1:535532579747:web:d1b57bc5b21299925ec816',
    messagingSenderId: '535532579747',
    projectId: 'vehicle-app-baedb',
    authDomain: 'vehicle-app-baedb.firebaseapp.com',
    storageBucket: 'vehicle-app-baedb.firebasestorage.app',
    measurementId: 'G-88SNHB3T63',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5tVtbJIuSSMeSH1Vr3Y3hjLoXB__tPlk',
    appId: '1:535532579747:android:dfb2fe1566e667a85ec816',
    messagingSenderId: '535532579747',
    projectId: 'vehicle-app-baedb',
    storageBucket: 'vehicle-app-baedb.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA3urVx3MeLeW6y6UPYKb0XCuG4-Lp-ofI',
    appId: '1:535532579747:ios:a1661cae82c93e135ec816',
    messagingSenderId: '535532579747',
    projectId: 'vehicle-app-baedb',
    storageBucket: 'vehicle-app-baedb.firebasestorage.app',
    iosBundleId: 'com.example.vehicleMonitoringApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA3urVx3MeLeW6y6UPYKb0XCuG4-Lp-ofI',
    appId: '1:535532579747:ios:a1661cae82c93e135ec816',
    messagingSenderId: '535532579747',
    projectId: 'vehicle-app-baedb',
    storageBucket: 'vehicle-app-baedb.firebasestorage.app',
    iosBundleId: 'com.example.vehicleMonitoringApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCk9UBcjs1noh2cbQxLqXhMn6sr6SIURnc',
    appId: '1:535532579747:web:e9edc1079baad67f5ec816',
    messagingSenderId: '535532579747',
    projectId: 'vehicle-app-baedb',
    authDomain: 'vehicle-app-baedb.firebaseapp.com',
    storageBucket: 'vehicle-app-baedb.firebasestorage.app',
    measurementId: 'G-SG18BWLFR8',
  );
}
