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
    apiKey: 'AIzaSyC68N5a4Bs4m_M9KUN3tkw40kmzEthzoW8',
    appId: '1:284610444937:web:9d99b43e4cf249c3fcd058',
    messagingSenderId: '284610444937',
    projectId: 'macrologisticguatemala',
    authDomain: 'macrologisticguatemala.firebaseapp.com',
    storageBucket: 'macrologisticguatemala.appspot.com',
    measurementId: 'G-2VBZ8427GF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDo_pEbw3771d6Kpg1KFKoKUjF9AtMvKDI',
    appId: '1:284610444937:android:cc5671964fbac57afcd058',
    messagingSenderId: '284610444937',
    projectId: 'macrologisticguatemala',
    storageBucket: 'macrologisticguatemala.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAYaBazHFHNu821i2HHZarOGMNYONAXYOA',
    appId: '1:284610444937:ios:0a4d5e8db6006122fcd058',
    messagingSenderId: '284610444937',
    projectId: 'macrologisticguatemala',
    storageBucket: 'macrologisticguatemala.appspot.com',
    iosBundleId: 'com.example.macrologistic',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAYaBazHFHNu821i2HHZarOGMNYONAXYOA',
    appId: '1:284610444937:ios:0a4d5e8db6006122fcd058',
    messagingSenderId: '284610444937',
    projectId: 'macrologisticguatemala',
    storageBucket: 'macrologisticguatemala.appspot.com',
    iosBundleId: 'com.example.macrologistic',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC68N5a4Bs4m_M9KUN3tkw40kmzEthzoW8',
    appId: '1:284610444937:web:9d99b43e4cf249c3fcd058',
    messagingSenderId: '284610444937',
    projectId: 'macrologisticguatemala',
    authDomain: 'macrologisticguatemala.firebaseapp.com',
    storageBucket: 'macrologisticguatemala.appspot.com',
    measurementId: 'G-2VBZ8427GF',
  );

}