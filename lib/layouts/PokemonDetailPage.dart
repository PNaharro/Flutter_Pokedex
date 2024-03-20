import 'package:flutter/material.dart';
import 'package:flutter_pokedex/app_data.dart'; 

class PokemonPageDetail extends StatelessWidget {
  final int pokemonId;

  PokemonPageDetail({required this.pokemonId});

  @override
  Widget build(BuildContext context) {
    PokemonData? pokemonData = AppData.getPokemonById(pokemonId);

    if (pokemonData == null) {
      // Manejar el caso en que no se encuentre el Pokémon
      return Scaffold(
        appBar: AppBar(
          title: Text('Detalles del Pokémon'),
        ),
        body: Center(
          child: Text('No se encontró información para el Pokémon con ID $pokemonId'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Pokémon'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ID - ${pokemonData.id} - ${pokemonData.nombre}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Image.asset(
                  pokemonData.imagen,
                  width: 400,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Tipo: ${pokemonData.tipo.join(", ")}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Descripcion: ${pokemonData.descripcion}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Altura: ${pokemonData.altura}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Peso: ${pokemonData.peso}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Habilidades: ${pokemonData.habilidades.join(", ")}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Generacion: ${pokemonData.generacion}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
