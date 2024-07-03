import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:macrologisticguatemala/config/enviroments.dart';
import 'package:macrologisticguatemala/models/reservas_response.dart';
import 'package:open_route_service/open_route_service.dart';

final myLocationProvider = StateProvider<LatLng?>((ref) => null);
final destinationProvider = StateProvider<LatLng?>((ref) => null);
final markersProvider = StateProvider<List<Marker>>((ref) => []);
final pointsProvider = StateProvider<List<LatLng>>((ref) => []);
final isLoadingProvider = StateProvider<bool>((ref) => false);

Future<void> updateMyLocation(WidgetRef ref) async {
  try {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('permisos ubicacion negados.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('permisos de ubicación denegados.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Permisos de ubicación denegados para siempre, no podemos solicitar permisos.');
    }

    final position = await Geolocator.getCurrentPosition();
    ref.read(myLocationProvider.notifier).state =
        LatLng(position.latitude, position.longitude);
  } catch (e) {
    print('Error al ir a ubicacion: $e');
  }
}

void updateMarkers(WidgetRef ref) {
  final myLocation = ref.read(myLocationProvider);
  final destination = ref.read(destinationProvider);

  if (myLocation != null && destination != null) {
    ref.read(markersProvider.notifier).state = [
      Marker(
        point: myLocation,
        width: 80,
        height: 80,
        child: const Icon(Icons.my_location, color: Colors.blue, size: 45),
      ),
      Marker(
        point: destination,
        width: 80,
        height: 80,
        child: const Icon(Icons.location_on, color: Colors.red, size: 45),
      ),
    ];
  }
}

Future<void> getCoordinates(WidgetRef ref, LatLng lat1, LatLng lat2) async {
  ref.read(isLoadingProvider.notifier).state = true;

  final OpenRouteService client = OpenRouteService(
    apiKey: Enviroments.apiMap,
  );

  try {
    final List<ORSCoordinate> routeCoordinates =
        await client.directionsRouteCoordsGet(
      startCoordinate: ORSCoordinate(
        latitude: lat1.latitude,
        longitude: lat1.longitude,
      ),
      endCoordinate: ORSCoordinate(
        latitude: lat2.latitude,
        longitude: lat2.longitude,
      ),
    );

    final List<LatLng> routePoints = routeCoordinates
        .map(
          (coordinate) => LatLng(coordinate.latitude, coordinate.longitude),
        )
        .toList();

    ref.read(pointsProvider.notifier).state = routePoints;
  } catch (e) {
    print('Error de rutas cordenadas: $e');
  } finally {
    ref.read(isLoadingProvider.notifier).state = false;
  }
}

final selectedReservaProvider = StateProvider<ReservasResponse?>((ref) => null);
final polylineProvider = StateProvider<List<Polyline>>((ref) => []);
