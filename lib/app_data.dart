import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PokemonData {
  final int id;
  final String imagen;
  final String nombre;
  final List<String> tipo;
  final String descripcion;
  final String altura;
  final String peso;
  final List<String> habilidades;
  final int generacion;

  PokemonData({
    required this.id,
    required this.imagen,
    required this.nombre,
    required this.tipo,
    required this.descripcion,
    required this.altura,
    required this.peso,
    required this.habilidades,
    required this.generacion,
  });

  factory PokemonData.fromJson(Map<String, dynamic> json) {
    return PokemonData(
      id: json['id'],
      imagen: json['imagen'],
      nombre: json['nombre'],
      tipo: List<String>.from(json['tipo']),
      descripcion: json['descripcion'],
      altura: json['altura'],
      peso: json['peso'],
      habilidades: List<String>.from(json['habilidades']),
      generacion: json['generacion'],
    );
  }
}

class AppData with ChangeNotifier {
  static late List<PokemonData> pokemonList;

  static Future<void> loadPokemonData() async {
    try {
      // Cargar el contenido del archivo JSON
      String jsonString = await rootBundle.loadString('assets/files/gen1.json');
      // Decodificar el JSON en una lista de mapas de Dart
      List<dynamic> data = jsonDecode(jsonString);
      // Mapear cada mapa a un objeto PokemonData
      pokemonList = data.map((json) => PokemonData.fromJson(json)).toList();
    } catch (e) {
      // Manejar cualquier error durante la carga de datos
      print('Error cargando datos del Pokémon: $e');
      pokemonList = []; // Establecer una lista vacía en caso de error
    }
  }

  static PokemonData? getPokemonById(int id) {
    print('Buscando Pokémon con ID: $id');
    PokemonData? pokemon =
        pokemonList.firstWhere((pokemon) => pokemon.id == id);
    print('Se encontró el Pokémon con ID: $id - ${pokemon.nombre}');
    return pokemon;
  }
}
