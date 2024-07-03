import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:macrologisticguatemala/models/reservas_response.dart';
import 'package:macrologisticguatemala/models/response_carreras.dart';
import 'package:macrologisticguatemala/providers/mylocation.dart';
import 'package:macrologisticguatemala/screens/reservas/home_reservas.dart';
import 'package:macrologisticguatemala/shared/CircularContainer.dart';
import 'package:macrologisticguatemala/theme/appStyle.dart';

class ReservasCard extends ConsumerWidget {
  final CarrerasResponse? reserva;
  ReservasCard({this.reserva});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () async {
        ref.read(destinationProvider.notifier).state = LatLng(
          double.parse(reserva!.puntoLlegadaCarreraLatitud),
          double.parse(reserva!.puntoLlegadaCarreraLongitud),
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
            child: const Icon(Icons.my_location, color: Colors.blue, size: 45),
          ),
          Marker(
            point: LatLng(double.parse(reserva!.puntoLlegadaCarreraLatitud),
                double.parse(reserva!.puntoLlegadaCarreraLongitud)),
            width: 80,
            height: 80,
            child: const Icon(Icons.location_on, color: Colors.red, size: 45),
          ),
        ];

        ref.read(polylineProvider.notifier).state = [
          Polyline(
            points: [
              LatLng(myLocation.latitude, myLocation.longitude),
              LatLng(double.parse(reserva!.puntoLlegadaCarreraLatitud),
                  double.parse(reserva!.puntoLlegadaCarreraLongitud))
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
      child: SizedBox(
        width: width * 0.97,
        height: height * 0.32,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Container(
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Lugar de recogida:',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(child: Container()),
                          //CircularContainer(iscolor: true),
                          Expanded(
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: 15,
                                  child: LayoutBuilder(
                                    builder: (BuildContext context,
                                        BoxConstraints constraints) {
                                      return Flex(
                                        direction: Axis.horizontal,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                          (constraints.constrainWidth() / 7)
                                              .floor(),
                                          (index) => SizedBox(
                                            width: 3,
                                            height: 1,
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Center(
                                  child: Icon(Icons.car_crash_outlined,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          //CircularContainer(iscolor: true),
                          Expanded(child: Container()),
                          Text(
                            'Lugar de entrega:',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Gap(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width * 0.3,
                            child: Text(
                              reserva!.direccion_recogida!.length > 20
                                  ? reserva!.direccion_recogida!
                                          .substring(0, 38) +
                                      '...'
                                  : reserva!.direccion_recogida!,
                              textAlign: TextAlign.end,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.3,
                            child: Text(
                              reserva!.direccion_llegada!.length > 20
                                  ? reserva!.direccion_llegada!
                                          .substring(0, 38) +
                                      '...'
                                  : reserva!.direccion_llegada!,
                              textAlign: TextAlign.end,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  reserva!.codReferencia.toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Gap(5),
                                Text(
                                  "Fecha: ${reserva!.fechaInicioReserva.toString().substring(0, 10)}",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  getEstadoReservaTexto(
                                      reserva!.estadoReserva.toString()),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: reserva!.estadoReserva == '4'
                                        ? Colors.yellow
                                        : reserva!.estadoReserva == '2'
                                            ? Colors.orange
                                            : Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Gap(16),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 1,
                                color: Colors.grey,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 1,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Gap(16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String getEstadoReservaTexto(String estadoReserva) {
  switch (estadoReserva) {
    case '2':
      return 'Asignada';
    case '4':
      return 'pendiente';
    default:
      return 'otro';
  }
}
