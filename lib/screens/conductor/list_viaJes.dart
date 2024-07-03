import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:macrologisticguatemala/config/enviroments.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macrologisticguatemala/models/reservas_response.dart';
import 'package:macrologisticguatemala/providers/filterList_state.dart';
import 'package:macrologisticguatemala/providers/getReservas.dart';
import 'package:macrologisticguatemala/screens/conductor/list_builder_viajes.dart';
import 'package:http/http.dart' as http;
import 'package:macrologisticguatemala/screens/pruebas/pruebabuilder.dart';

class ListViajes extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viajesAsyncValue = ref.watch(carerrasProvider);
    final viajesPendientes = Viajeslist().filterByStatus('Pendiente');
    final ScrollController _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        ref.refresh(viajesProvider);
      }
    });

    return RefreshIndicator(
      onRefresh: () => ref.refresh(carerrasProvider.future),
      child: MaterialApp(
        color: Enviroments.primaryColor,
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            
            appBar: AppBar(
              title:Center(child: Image.asset(
                'assets/logoSistema.png',
                width: 125,
              ),),
              bottom: const TabBar(
                tabs: [
                  Tab(
                    text: 'Completados',
                  ),
                  Tab(
                    text: 'Pendientes',
                  ),
                ],
              ),
            ),
            body: viajesAsyncValue.when(
              data: (viajes) {
                return TabBarView(
                  children: [
                    PruebaListviajest(),
                    Listviajest(
                      reservas: viajes,
                    ),
                  ],
                );
              },
              loading: () => CircularProgressIndicator(),
              error: (err, stack) => Text('Error: $err'),
            ),
          ),
        ),
      ),
    );
  }
}
