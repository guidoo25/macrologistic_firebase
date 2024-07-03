import 'package:flutter/material.dart';
import 'package:macrologisticguatemala/screens/maps/mapscreen.dart';
import 'package:macrologisticguatemala/widgets/conductor.dart';
import 'package:macrologisticguatemala/widgets/noasignado_card.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: MapScreen(),
        ),
        Align(
          alignment: Alignment.center,
          child: NoSelectedTripsCard(),
        ),
      ],
    );
  }
}
