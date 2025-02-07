import 'package:flutter/material.dart';
import 'package:macrologisticguatemala/models/viaje.dart';
import 'package:macrologisticguatemala/screens/maps/mapscreen.dart';
import 'package:macrologisticguatemala/widgets/conductor.dart';

class HomeReservas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            child: MapScreen(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CardConductor(),
          ),
        ],
      ),
    );
  }
}
