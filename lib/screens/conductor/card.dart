import 'package:flutter/material.dart';
import 'package:macrologisticguatemala/models/reservas_response.dart';

class ConductorCard extends StatelessWidget {
  final ReservasResponse reserva;

  ConductorCard({
    required this.reserva,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Desde: ${reserva.descripcionInicio}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Hasta: ${reserva.descripcionFin}',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Fecha Inicio: ${reserva.fechaInicio.toLocal()}',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Fecha Fin: ${reserva.fechaFin.toLocal()}',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Estado: ${reserva.estado}',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                'Fecha: ${reserva.fechaInicio}',
                style: TextStyle(
                  fontSize: 14,
                ),
              )
            ],
          ),
          const Spacer(),
          // Si tienes una imagen asociada con la reserva, ajusta esto según sea necesario.
          // Actualmente, ReservasResponse no tiene un campo imagen.
        ],
      ),
    );
  }
}
