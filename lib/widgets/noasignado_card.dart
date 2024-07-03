import 'package:flutter/material.dart';

class NoSelectedTripsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      child: Container(
        height: 100,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(
            'Tienes Viajes Pendientes por completar',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
