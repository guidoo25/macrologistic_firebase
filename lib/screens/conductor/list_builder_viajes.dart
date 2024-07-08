import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:macrologisticguatemala/models/response_carreras.dart';
import 'package:macrologisticguatemala/providers/mylocation.dart';
import 'package:macrologisticguatemala/screens/conductor/cards_viajes/card_viaje.dart';

class Listviajest extends ConsumerWidget {
  final List<CarrerasResponse> reservas;

  Listviajest({
    required this.reservas,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: reservas.length,
      itemBuilder: (context, index) {
        CarrerasResponse reserva = reservas[index];

        // Determinar el color del estado
        Color estadoColor =
            reserva.estadoDriverReserva == '1' ? Colors.green : Colors.yellow;

        return Padding(
          padding:
              const EdgeInsets.all(5.0), // Adjust the padding value as needed
          child: ReservasCard(
            reserva: reserva,
          ),
        );
      },
    );
  }
}
