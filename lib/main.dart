import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macrologisticguatemala/config/enviroments.dart';
import 'package:macrologisticguatemala/providers/login_api/login_api.dart';
import 'package:macrologisticguatemala/providers/notifiaciones/notificaiones_provider.dart';
import 'package:macrologisticguatemala/router/approuter.dart';
import 'package:macrologisticguatemala/theme/apptheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 

  await NotificacionesNotifier.initializeFCM().then((_) {
    print("Firebase inicializado correctamente");

    NotificacionesNotifier.permisos().then((_) {
      print("Permisos solicitados correctamente");
    }).catchError((error) {
      print("Error al solicitar permisos: $error");
    });
  }).catchError((error) {
    print("Error al inicializar Firebase: $error");
  });

  HttpOverrides.global = MyHttpOverrides();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Enviroments().initEnviroments();
  final authNotifier = AuthNotifierLocal();
  
  await authNotifier.login();
  final notificacionesNotifier = NotificacionesNotifier();
  notificacionesNotifier.onForgrounedMessage();

  runApp(const ProviderScope(child: MainApp()));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      
    );
  }
}
