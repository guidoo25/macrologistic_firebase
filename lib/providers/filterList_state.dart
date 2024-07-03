import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macrologisticguatemala/models/viaje.dart';

class Viajeslist extends StateNotifier<List<Viaje>> {
  Viajeslist() : super([]);

  void addTask(Viaje task) {
    state = [...state, task];
  }

  void removeTask(Viaje task) {
    state = state.where((element) => element != task).toList();
  }

  List<Viaje> filterByStatus(String status) {
    return state.where((task) => task.estado == status).toList();
  }
}

final vaijesListProvider =
    StateNotifierProvider<Viajeslist, List<Viaje>>((ref) => Viajeslist());
