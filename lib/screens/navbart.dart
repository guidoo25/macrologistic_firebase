import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:macrologisticguatemala/config/enviroments.dart';
import 'package:macrologisticguatemala/screens/conductor/list_viaJes.dart';
import 'package:macrologisticguatemala/screens/homescreen.dart';
import 'package:macrologisticguatemala/screens/maps/mapview.dart';
import 'package:macrologisticguatemala/screens/perfil/perfil.dart';

class navbarInicial extends StatefulWidget {
  static const name = 'homeScreen';
  @override
  State<navbarInicial> createState() => _homeScreenState();
}

class _homeScreenState extends State<navbarInicial> {
  int selectedIndex = 0;
  final screens = [ListViajes(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: CupertinoTabBar(
        // Use CupertinoTabBar for Apple-like appearance
        backgroundColor: Colors.white,

        currentIndex: selectedIndex,
        onTap: ((value) => setState(() => selectedIndex = value)),
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black12,
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home_filled),
            label: 'viajes',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black12,
            icon: Icon(Icons.account_circle),
            activeIcon: Icon(Icons.account_circle_rounded),
            label: 'perfil',
          ),
        ],
      ),
    );
  }
}
