import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:macrologisticguatemala/config/enviroments.dart';
import 'package:macrologisticguatemala/providers/auth_providers.dart';
import 'package:macrologisticguatemala/shared/button_estade.dart';
import 'package:macrologisticguatemala/providers/mylocation.dart';
import 'package:macrologisticguatemala/widgets/loadingButton.dart';

class CardConductor extends ConsumerStatefulWidget {
  @override
  _CardConductorState createState() => _CardConductorState();
}

class _CardConductorState extends ConsumerState<CardConductor> {
  final picker = ImagePicker();
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    final columnIndex = ref.watch(columnProvider);
    LatLng finalPosition = LatLng(-2.1482, -79.9667);
    final myLocation = ref.read(myLocationProvider);

    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize
                .min, // Hace que la columna ocupe solo el espacio necesario
            children: [
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 10),
                    // MyButtonestade(
                    //   onTap: () async {
                    //     await updateMyLocation(ref);
                    //     LatLng finalPosition = LatLng(-2.1482, -79.9667);
                    //     ref.read(destinationProvider.notifier).state =
                    //         finalPosition;
                    //     updateMarkers(ref);
                    //     // Llamar a getCoordinates si la ubicación actual ya está disponible
                    //     final myLocation = ref.read(myLocationProvider);
                    //     if (myLocation != null) {
                    //       ref
                    //           .read(pointsProvider.notifier)
                    //           .state
                    //           .clear(); // Limpiar puntos previos
                    //       getCoordinates(ref, myLocation, finalPosition);
                    //     }
                    //   },
                    //   nametext: 'Partida',
                    //   color: Colors.yellow,
                    //   icon: Icons.play_arrow,
                    // ),
                    // SizedBox(width: 10),
                    // MyButtonestade(
                    //   onTap: () async {
                    //     final turist = LatLng(-2.1895, -79.8780);
                    //     ref.read(destinationProvider.notifier).state = turist;
                    //     updateMarkers(ref);
                    //     final myLocation = ref.read(myLocationProvider);
                    //     if (myLocation != null) {
                    //       ref
                    //           .read(pointsProvider.notifier)
                    //           .state
                    //           .clear(); // Limpiar puntos previos
                    //       getCoordinates(ref, myLocation, turist);
                    //     }
                    //   },
                    //   nametext: 'Inicio',
                    //   color: Colors.blue,
                    //   icon: Icons.location_on,
                    // ),
                    // SizedBox(width: 10),
                    // MyButtonestade(
                    //   onTap: () {},
                    //   nametext: 'Final',
                    //   color: Colors.green,
                    //   icon: Icons.flag,
                    // ),
                    // SizedBox(width: 10),
                    // MyButtonestade(
                    //   onTap: () {
                    //     showDialog(
                    //       context: context,
                    //       builder: (context) => AlertDialog(
                    //         title: Text('No show'),
                    //         content: Column(
                    //           children: [
                    //             ElevatedButton(
                    //               onPressed: getImage,
                    //               child: Text('Subir foto de evento'),
                    //             ),
                    //             // Muestra la imagen seleccionada
                    //             _selectedImage != null
                    //                 ? Image.file(_selectedImage!)
                    //                 : Container(
                    //                     width: 200,
                    //                     height: 200,
                    //                     decoration: BoxDecoration(
                    //                       color: Colors.grey[200],
                    //                       border: Border.all(
                    //                           color: Colors.grey[400]!),
                    //                     ),
                    //                     child: Icon(Icons.image,
                    //                         color: Colors.grey[400]),
                    //                   ),
                    //           ],
                    //         ),
                    //         actions: [
                    //           TextButton(
                    //               onPressed: () {
                    //                 Navigator.of(context).pop();
                    //               },
                    //               child: Text('Enviar'))
                    //         ],
                    //       ),
                    //     );
                    //   },
                    //   nametext: 'Novedad',
                    //   color: Colors.red,
                    //   icon: Icons.warning_rounded,
                    // ),

                    if (columnIndex == 0) ...[
                      Center(
                        // Asegura que el botón esté centrado horizontalmente
                        child: LoadingButton(
                          loadingStateText: "loading...",
                          bgColor: Enviroments.primaryColor,
                          text: 'En camino a recoger al cliente',
                          onPressed: () async => {
                            await Future.delayed(const Duration(seconds: 2)),
                            ref.read(columnProvider.notifier).state =
                                (columnIndex + 1) % 4,
                            //TODO:ANADIR METODO PARA PICKUP 1
                            await updateMyLocation(ref),
                            ref.read(destinationProvider.notifier).state =
                                finalPosition,
                            updateMarkers(ref),
                            // Llamar a getCoordinates si la ubicación actual ya está disponible
                            if (myLocation != null)
                              {
                                ref
                                    .read(pointsProvider.notifier)
                                    .state
                                    .clear(), // Limpiar puntos previos
                                getCoordinates(ref, myLocation, finalPosition),
                              }
                          },
                        ),
                      ),
                    ] else if (columnIndex == 1) ...[
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            LoadingButton(
                              loadingStateText: "Cargando...",
                              onPressed: () async => {
                                await Future.delayed(
                                    const Duration(seconds: 2)),
                                ref.read(columnProvider.notifier).state =
                                    (columnIndex + 1) % 4,
                                //TODO: Aquí se debe enviar la ubicación del cliente a la api local de la empresa
                              },
                              bgColor: Enviroments.primaryColor,
                              text: 'En el punto de recogida',
                            ),
                          ],
                        ),
                      ),
                    ] else if (columnIndex == 2) ...[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          LoadingButton(
                            onPressed: () async => {
                              await Future.delayed(const Duration(seconds: 2)),
                              ref.read(columnProvider.notifier).state =
                                  (columnIndex + 1) % 4,
                              //TODO: Aquí se debe enviar la ubicación del cliente a la api  local de la empresa
                            },
                            bgColor: Enviroments.primaryColor,
                            text: 'Buscando pasajero',
                          ),
                          SizedBox(height: 10),
                          TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text('No show'),
                                          content: Column(
                                            children: [
                                              ElevatedButton(
                                                onPressed: getImage,
                                                child: Text(
                                                    'Subir foto de evento'),
                                              ),
                                              // Muestra la imagen seleccionada
                                              _selectedImage != null
                                                  ? Image.file(_selectedImage!)
                                                  : Container(
                                                      width: 200,
                                                      height: 200,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey[200],
                                                        border: Border.all(
                                                            color: Colors
                                                                .grey[400]!),
                                                      ),
                                                      child: Icon(Icons.image,
                                                          color:
                                                              Colors.grey[400]),
                                                    ),
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  //TODO: ANADIR METODO DE ENVIAR EL NO SHOW
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('Enviar'))
                                          ],
                                        ));
                              },
                              child: Text(
                                'No show',
                                style: TextStyle(
                                  color: Colors
                                      .red, // Establece el color del texto a rojo
                                ),
                              )),
                        ],
                      )
                    ] else if (columnIndex == 3) ...[
                      ElevatedButton(
                        onPressed: () => ref
                            .read(columnProvider.notifier)
                            .state = (columnIndex + 1) % 4,
                        style: ElevatedButton.styleFrom(
                          // Color del texto
                          elevation: 5, // Elevación para sombra
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  12)), // Bordes redondeados
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10), // Padding
                        ),
                        child: Text('Llevando pasajero a destino'),
                      ),
                    ] else ...[
                      ElevatedButton(
                        onPressed: () => {
                          //TODO: ANADIR METODO DE DROPOFF FINAL
                          ref.read(columnProvider.notifier).state =
                              (columnIndex + 1) % 4,
                          Navigator.pop(context),
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 5, // Elevación para sombra
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  12)), // Bordes redondeados
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10), // Padding
                        ),
                        child: Text('Finalizar viaje'),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Nombre del Cliente',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              Text('Status:Asignado'),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.black),
                  const SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      'Ubicación del Cliente: Aeropuerto Jose Joaquin de Olmedo',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Icon(Icons.arrow_forward, color: Colors.black),
                  const SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      'Lugar de destino: Hotel Oro Verde',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Future getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        _selectedImage = File(pickedImage.path);
      } else {
        print('imagen no seleccionada');
      }
    });
  }
}
