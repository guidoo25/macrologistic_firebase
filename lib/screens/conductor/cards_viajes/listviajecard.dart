import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:macrologisticguatemala/models/reservas_response.dart';
import 'package:macrologisticguatemala/models/response_carreras.dart';
import 'package:macrologisticguatemala/providers/mylocation.dart';
import 'package:macrologisticguatemala/screens/conductor/cards_viajes/card_viaje.dart';
import 'package:macrologisticguatemala/screens/reservas/home_reservas.dart';
import 'package:gap/gap.dart';
import 'package:macrologisticguatemala/shared/CircularContainer.dart';
import 'package:macrologisticguatemala/theme/appStyle.dart';

class Listviajest2 extends ConsumerWidget {
  final List<CarrerasResponse> reservas;

  Listviajest2({
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
            reserva.estadoReserva == '3' ? Colors.green : Colors.yellow;

        return GestureDetector(
          onTap: () async {
            ref.read(destinationProvider.notifier).state = LatLng(
              double.parse(reserva.puntoLlegadaCarreraLatitud),
              double.parse(reserva.puntoLlegadaCarreraLongitud),
            );
            await updateMyLocation(ref);
            final myLocation = await Geolocator.getCurrentPosition();
            ref.read(myLocationProvider.notifier).state =
                LatLng(myLocation.latitude, myLocation.longitude);

            ref.read(markersProvider.notifier).state = [
              Marker(
                point: LatLng(myLocation.latitude, myLocation.longitude),
                width: 80,
                height: 80,
                child:
                    const Icon(Icons.my_location, color: Colors.blue, size: 45),
              ),
              Marker(
                point: LatLng(double.parse(reserva.puntoLlegadaCarreraLongitud),
                    double.parse(reserva.puntoLlegadaCarreraLatitud)),
                width: 80,
                height: 80,
                child:
                    const Icon(Icons.location_on, color: Colors.red, size: 45),
              ),
            ];

            ref.read(polylineProvider.notifier).state = [
              Polyline(
                points: [
                  LatLng(myLocation.latitude, myLocation.longitude),
                  LatLng(double.parse(reserva.puntoLlegadaCarreraLatitud),
                      double.parse(reserva.puntoLlegadaCarreraLongitud))
                ],
                strokeWidth: 4.0,
                color: Colors.blue,
              ),
            ];

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeReservas()),
            );
          },
          child: ReservasCard(reserva: reserva),
        );
      },
    );
  }
}
