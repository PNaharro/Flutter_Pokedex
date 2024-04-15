import 'package:flutter/material.dart';
import 'package:flutter_pokedex/pokemonDetails/PokemonDetailForm.dart';

import '../app_data.dart';

class PrimeraGen extends StatefulWidget {
  const PrimeraGen({Key? key}) : super(key: key);

  @override
  PrimeraGenIntroState createState() => PrimeraGenIntroState();
}

class PrimeraGenIntroState extends State<PrimeraGen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        // Personaliza el AppBar con una imagen de fondo
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/regiones/gen1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: Text(
              'Kanto',
              style: TextStyle(
                color: Colors.white, // Color del texto del título
                fontSize: 30, // Tamaño del texto del título
                fontWeight: FontWeight.bold, // Peso de la fuente del título
              ),
            ),
          ),
        ),
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
        _navigateToPokemonDetails(number.toString());
      },
      child: ListTile(
        contentPadding: EdgeInsets.zero, // Elimina el padding del ListTile
        title: Row(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Alineación vertical al centro
          children: [
            SizedBox(width: 20),
            Text(
              number.toString(),
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            SizedBox(width: 20), // Espacio entre el número y el nombre
            Expanded(
              child: FutureBuilder(
                future: AppData.loadPokemonData(),
                builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    PokemonData? pokemon = AppData.getPokemonById(number);
                    if (pokemon != null) {
                      return Text(
                        pokemon.nombre,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      );
                    } else {
                      return Text(
                        'Nombre no encontrado',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      );
                    }
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
            SizedBox(width: 20), // Espacio entre el nombre y la imagen
            Container(
              alignment:
                  Alignment.centerLeft, // Alinea la imagen a la izquierda
              child: Image.asset(
                'assets/icons/$number.png',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToPokemonDetails(String id) {
    int pokemonId = int.parse(id);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PokemonPageDetail(pokemonId: pokemonId),
      ),
    );
  }

  // Función para mostrar el mensaje de bienvenida
  void _showWelcomeMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Primera generacion'),
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
