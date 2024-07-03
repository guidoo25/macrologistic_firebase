import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:macrologisticguatemala/config/enviroments.dart';
import 'package:macrologisticguatemala/providers/mylocation.dart';
import 'package:open_route_service/open_route_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  final MapController mapController = MapController();
  final LatLng defaultPoint = LatLng(-2.19616, -79.88621);

  @override
  void initState() {
    super.initState();
    updateMyLocation(ref);
  }

  Future<void> getCoordinates(LatLng lat1, LatLng lat2) async {
    ref.read(isLoadingProvider.notifier).state = true;

    final OpenRouteService client = OpenRouteService(
      apiKey: Enviroments.apiMap,
    );

    try {
      final List<ORSCoordinate> routeCoordinates =
          await client.directionsRouteCoordsGet(
        startCoordinate:
            ORSCoordinate(latitude: lat1.latitude, longitude: lat1.longitude),
        endCoordinate:
            ORSCoordinate(latitude: lat2.latitude, longitude: lat2.longitude),
      );

      final List<LatLng> routePoints = routeCoordinates
          .map(
              (coordinate) => LatLng(coordinate.latitude, coordinate.longitude))
          .toList();

      ref.read(pointsProvider.notifier).state = routePoints;
    } catch (e) {
      print('Error getting route coordinates: $e');
    } finally {
      ref.read(isLoadingProvider.notifier).state = false;
    }
  }

  void _handleTap(LatLng latLng) {
    final myLocation = ref.read(myLocationProvider);
    if (myLocation != null) {
      ref.read(destinationProvider.notifier).state = latLng;

      ref.read(markersProvider.notifier).state = [
        Marker(
          point: myLocation,
          width: 80,
          height: 80,
          child: const Icon(Icons.my_location, color: Colors.blue, size: 45),
        ),
        Marker(
          point: latLng,
          width: 80,
          height: 80,
          child: const Icon(Icons.location_on, color: Colors.red, size: 45),
        ),
      ];

      getCoordinates(myLocation, latLng);
    }
  }

  @override
  Widget build(BuildContext context) {
    final markers = ref.watch(markersProvider);
    final points = ref.watch(pointsProvider);
    final isLoading = ref.watch(isLoadingProvider);
    final myLocation = ref.watch(myLocationProvider);

    return Scaffold(
      body: myLocation == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                FlutterMap(
                  mapController: mapController,
                  options: MapOptions(
                    zoom: 16,
                    center: myLocation ?? defaultPoint,
                    onTap: (tapPosition, latLng) => _handleTap(latLng),
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                    ),
                    MarkerLayer(
                      markers: markers,
                    ),
                    PolylineLayer(
                      polylineCulling: false,
                      polylines: [
                        Polyline(
                          points: points,
                          color: Enviroments.primaryColor,
                          strokeWidth: 5,
                        ),
                      ],
                    ),
                  ],
                ),
                Visibility(
                  visible: isLoading,
                  child: Container(
                    color: Enviroments.primaryColor.withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top + 20.0,
                  left: MediaQuery.of(context).size.width / 2 - 110,
                  child: Align(
                    child: TextButton(
                      onPressed: () async {
                        final myLocation = ref.read(myLocationProvider);
                        final destination = ref.read(destinationProvider);
                        if (ref.read(markersProvider).length == 2) {
                          final start = ref.read(markersProvider)[0].point;
                          final end = ref.read(markersProvider)[1].point;

                          _launchMaps(start, end);
                        }
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Enviroments.primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            ref.read(markersProvider).length < 2
                                ? "Ruta"
                                : "Ver en Maps",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              mapController.move(mapController.center, mapController.zoom + 1);
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: Enviroments.primaryColor,
            onPressed: () {
              mapController.move(mapController.center, mapController.zoom - 1);
            },
            child: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

void _launchMaps(LatLng start, LatLng end) async {
  final String googleMapsUrl =
      'https://www.google.com/maps/dir/?api=1&origin=${start.latitude},${start.longitude}&destination=${end.latitude},${end.longitude}&travelmode=driving';
  final String wazeUrl =
      'https://waze.com/ul?ll=${end.latitude},${end.longitude}&navigate=yes';

  if (await canLaunch(googleMapsUrl)) {
    await launch(googleMapsUrl);
  } else if (await canLaunch(wazeUrl)) {
    await launch(wazeUrl);
  } else {
    throw 'Could not launch URL';
  }
}
