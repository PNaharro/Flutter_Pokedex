import 'package:flutter/material.dart';
import 'package:flutter_pokedex/app_data.dart';

class PokemonPageDetail extends StatefulWidget {
  final int pokemonId;

  PokemonPageDetail({required this.pokemonId});

  @override
  _PokemonPageDetailState createState() => _PokemonPageDetailState();
}

class _PokemonPageDetailState extends State<PokemonPageDetail> {
  late int currentIndex;
  late PokemonData currentPokemon;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.pokemonId;
    currentPokemon = AppData.getPokemonById(currentIndex)!;
  }

  void _showNextPokemon() {
    setState(() {
      currentIndex =
          (currentIndex % 151) + 1; // Incrementa el índice circularmente
      currentPokemon = AppData.getPokemonById(currentIndex)!;
    });
  }

  void _showPreviousPokemon() {
    setState(() {
      currentIndex = (currentIndex == 1)
          ? 151
          : currentIndex - 1; // Decrementa el índice circularmente
      currentPokemon = AppData.getPokemonById(currentIndex)!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Pokémon'),
        backgroundColor: Colors.red, // Fondo rojo para la AppBar superior
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: _showPreviousPokemon,
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: _showNextPokemon,
            ),
          ],
        ),
        color: Colors.red, // Fondo rojo para la BottomAppBar
      ),
      backgroundColor: Colors.red, // Fondo rojo para el fondo de la pantalla
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.white,
                          width: 2), // Borde blanco de 2 píxeles de ancho
                    ),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ID - ${currentPokemon.id} - ${currentPokemon.nombre}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: Image.asset(
                            currentPokemon.imagen,
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Tipo: ${currentPokemon.tipo.join(", ")}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Descripcion: ${currentPokemon.descripcion}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Altura: ${currentPokemon.altura}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Peso: ${currentPokemon.peso}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Habilidades: ${currentPokemon.habilidades.join(", ")}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Generacion: ${currentPokemon.generacion}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
