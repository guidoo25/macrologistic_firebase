import 'package:flutter/material.dart';
import 'package:macrologisticguatemala/models/viaje.dart';

class PruebaListviajest extends StatelessWidget {
  List<Viaje> viajesBonitos = [];

  final List<Viaje> viajeslista = [
    Viaje(
      origen: 'AV de las Americas',
      cliente: 'Juan Perez',
      destino: 'Alborada 4t Etapa',
      descripcion: '5 minutos de viaje',
      estado: 'Completado',
      imagen: 'assets/map.PNG',
      fecha: '2024-10-10  13:00',
    ),
    Viaje(
      origen: ' villamil playas',
      cliente: 'Maria Yanez',
      destino: 'Shopping libertad',
      descripcion: '1:30 de viaje',
      estado: 'Cancelado',
      imagen: '',
      fecha: '2024-10-10  15:00',
    ),
    Viaje(
      cliente: 'Carlos Rodriguez',
      origen: 'Cementerio general',
      destino: 'Arcos Plaza',
      descripcion: '1 hora de viaje',
      estado: 'Completado',
      imagen: 'assets/map2.PNG',
      fecha: '2024-10-10  17:00',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: viajeslista.length,
      itemBuilder: (context, index) {
        Viaje viaje = viajeslista[index];

        // Determinar el color del estado
        Color estadoColor = index % 2 == 0 ? Colors.green : Colors.red;

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: const Icon(Icons.location_on),
            title: Text('Salida:${viaje.origen}',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Row(
              children: [
                Icon(Icons.arrow_forward),
                Text('Destino:${viaje.destino}'),
              ],
            ),
            trailing: CircleAvatar(
              backgroundColor: estadoColor,
              radius: 9,
            ),
            onTap: () {
              showDialog(
                
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Trazabilidad del viaje'),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Cliente: ${viaje.cliente}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text('Destino: ${viaje.destino}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text('Descripción: ${viaje.descripcion}',
                          style: const TextStyle(fontSize: 12)),
                      Text('Estado: ${viaje.estado}',
                          style: const TextStyle(color: Colors.grey)),
                      Container(
                        child: viaje.imagen.isNotEmpty
                            ? Image.asset('${viaje.imagen}', height: 150)
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cerrar'),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
