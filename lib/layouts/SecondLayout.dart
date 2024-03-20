import 'package:flutter/material.dart';
import 'PrimeraGen.dart'; // Importa el widget de la primera generación

class SecondLayout extends StatefulWidget {
  const SecondLayout({Key? key}) : super(key: key);

  @override
  SecondLayoutIntroState createState() => SecondLayoutIntroState();
}

class SecondLayoutIntroState extends State<SecondLayout> {
  @override
  Widget build(BuildContext context) {
    // Llamamos a _showWelcomeMessage después de que el layout se ha cargado completamente
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showWelcomeMessage(context);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Selecciona región',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Lógica para manejar el botón de opciones aquí
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 1),
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) {
                return _buildButton(index + 1);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(int number) {
    return Container(
      height: 200,
      width: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/regiones/gen$number.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: TextButton(
          onPressed: () {
            _navigateToPrimeraGen(context); // Navegar a PrimeraGen.dart
          },
          child: Text(
            "Gen " + number.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToPrimeraGen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => PrimeraGen()), // Navegar a PrimeraGen.dart
    );
  }

  // Función para mostrar el mensaje de bienvenida
  void _showWelcomeMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bienvenido a la Pokédex'),
          content: Text('¡Explora el mundo Pokémon ahora!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
