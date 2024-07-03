import 'package:flutter/material.dart';

class MyButtonestade extends StatelessWidget {
  final Function()? onTap;
  final String nametext;
  final Color color;
  final IconData icon;

  const MyButtonestade({required this.onTap, required this.nametext,required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 75, 
        height: 75, 
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8), // Ajusta el radio del borde para crear una forma cuadrada
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Color de la sombra
              spreadRadius: 2, // Radio de expansión de la sombra
              blurRadius: 5, // Radio de desenfoque de la sombra
              offset: Offset(0, 3), // Desplazamiento de la sombra en el eje x y el eje y
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white,),
            const SizedBox(height: 10),
            Text(
              nametext,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}