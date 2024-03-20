import 'package:flutter/material.dart';
import 'package:flutter_pokedex/layouts/PokemonDetailPage.dart';

class PrimeraGen extends StatefulWidget {
  const PrimeraGen({Key? key}) : super(key: key);

  @override
  PrimeraGenIntroState createState() => PrimeraGenIntroState();
}

class PrimeraGenIntroState extends State<PrimeraGen> {
  @override
  Widget build(BuildContext context) {
    //WidgetsBinding.instance!.addPostFrameCallback((_) {
    //  _showWelcomeMessage(context);
    //});

    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text(
          'Kanto (Gen1)',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
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
      body: Column(
        children: [
          // Encabezado "Kanto (Gen1)"
          Expanded(
            child: ListView.builder(
              itemCount: 151, // Número de elementos en la lista
              itemBuilder: (context, index) {
                // Construye cada elemento de la lista como un botón
                return _buildNumberButton(index + 1);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Función para construir un botón para cada número
  Widget _buildNumberButton(int number) {
    return TextButton(
      onPressed: () {
        //_navigateToPokemonDetails(number.toString());
      },
      child: ListTile(
        title: Text(
          number.toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

// Función para navegar a la página de detalles del Pokémon
  /**void _navigateToPokemonDetails(String id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PokemonDetailPage(pokemonId: id),
      ),
    );
  }**/

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
