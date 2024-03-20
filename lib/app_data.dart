import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PokemonData {
  final String image;
  final int id;
  final String name;
  final List<String> type;
  final String description;
  final String height;
  final String weight;
  final List<String> abilities;
  final int generation;

  PokemonData({
    required this.image,
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.generation,
  });

  factory PokemonData.fromJson(Map<String, dynamic> json) {
    return PokemonData(
      image: json['imagen'],
      id: json['id'],
      name: json['nombre'],
      type: List<String>.from(json['tipo']),
      description: json['descripción'],
      height: json['altura'],
      weight: json['peso'],
      abilities: List<String>.from(json['habilidades']),
      generation: json['generación'],
    );
  }
}

class AppData with ChangeNotifier {
  static late List<PokemonData> pokemonList;

  static Future<void> loadPokemonData() async {
    try {
      // Cargar el contenido del archivo JSON
      String jsonString =
          await rootBundle.loadString('assets/files/gen1.json');
      // Decodificar el JSON en un mapa de Dart
      Map<String, dynamic> data = jsonDecode(jsonString);
      // Extraer la lista de Pokémon del mapa
      List<dynamic> pokemonData = data['pokémon'];
      // Mapear cada mapa a un objeto PokemonData
      pokemonList =
          pokemonData.map((json) => PokemonData.fromJson(json)).toList();
    } catch (e) {
      // Manejar cualquier error durante la carga de datos
      print('Error cargando datos del Pokémon: $e');
      pokemonList = []; // Establecer una lista vacía en caso de error
    }
  }
}
