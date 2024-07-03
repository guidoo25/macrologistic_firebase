import 'package:flutter/material.dart';
import 'package:macrologisticguatemala/models/viaje.dart';

class PruebaConductorCard extends StatelessWidget {
  final Viaje viaje;

  PruebaConductorCard({
    required this.viaje,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Origen: ${viaje.origen}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Cliente: ${viaje.cliente}',
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Destino: ${viaje.destino}',
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Fecha: ${viaje.fecha}',
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Estado: ${viaje.estado}',
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const Spacer(),
          Image.asset(
            'assets/${viaje.imagen}',
            width: 50,
            height: 50,
          ),
        ],
      ),
    );
  }
}
