import 'package:flutter/material.dart';
import 'primeraGenForm.dart';

class primergenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kanto',
            style: TextStyle(color: Colors.black)), // Color del texto blanco
        backgroundColor: Colors.red, // Fondo negro
        elevation: 0, // Elimina la sombra de la barra de aplicación
      ),
      backgroundColor: Colors.red, // Fondo negro del Scaffold
      body: PrimeraGen(),
    );
  }
}
