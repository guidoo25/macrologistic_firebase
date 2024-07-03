import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macrologisticguatemala/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

final notificacionesProvider = StateNotifierProvider<NotificacionesNotifier, List<String>>((ref) {
  return NotificacionesNotifier();
});

class NotificacionesNotifier extends StateNotifier<List<String>> {
  NotificacionesNotifier() : super([]) {
    _init();
  }

  Future<void> _init() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('contnenido noficiacion: ${message.notification}');
        state = [...state, message.notification!.title ?? 'Sin título'];
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
    });
    void _getFCMToken() async {
     final settings = await messaging.getNotificationSettings();
     if(settings.authorizationStatus == AuthorizationStatus.authorized) return;
      final token = await messaging.getToken();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token_firebase', token!);


      
      print('firebaseToken${token}');
    }

    String? token = await messaging.getToken();
    print('Firebase  Token: $token');
  }

  void _handdlerRemotteMessage (RemoteMessage message){
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('contnenido noficiacion: ${message.notification}');
      state = [...state, message.notification!.title ?? 'Sin título'];
    }
  }

  void onForgrounedMessage (){
    FirebaseMessaging.onMessage.listen(_handdlerRemotteMessage);
  
  }
static Future<void> initializeFCM() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  // Verifica si los permisos fueron concedidos
  if (settings.authorizationStatus == AuthorizationStatus.authorized ||
      settings.authorizationStatus == AuthorizationStatus.provisional) {
    // Obtiene el token de FCM
    String? token = await FirebaseMessaging.instance.getToken();
   
    print("Firebase Messaging Token: $token");

  } else {
    print("Permission declined by the user");
  }
}

  static Future <void> permisos() async {
        FirebaseMessaging messaging = FirebaseMessaging.instance;
        NotificationSettings settings = await messaging.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true,
        );
        settings.authorizationStatus;
  }



}