import 'package:go_router/go_router.dart';
import 'package:macrologisticguatemala/screens/conductor/cards_viajes/scaffoldprueba.dart';
import 'package:macrologisticguatemala/screens/conductor/list_viaJes.dart';
import 'package:macrologisticguatemala/screens/homescreen.dart';
import 'package:macrologisticguatemala/screens/login/login.dart';

import 'package:macrologisticguatemala/screens/navbart.dart';

final appRouter = GoRouter(initialLocation: '/Login', routes: [
  GoRoute(
    path: '/Login',
    name: 'Login',
    builder: (context, state) => LoginPage(),
  ),
  GoRoute(
      path: '/Home',
      name: 'Home',
      builder: (context, state) => navbarInicial()),
   GoRoute(
     path: '/viajes',
     name: 'viajes',
     builder: (context, state) => ListViajes(),
   ),
]);
