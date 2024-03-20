import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class PokemonDetailPage extends StatefulWidget {
  final String pokemonJsonPath;
  final String pokemonId;

  PokemonDetailPage({required this.pokemonJsonPath, required this.pokemonId});

  @override
  _PokemonDetailPageState createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  late Map<String, dynamic> pokemonData;

  @override
  void initState() {
    super.initState();
    _loadPokemonData();
  }

  Future<void> _loadPokemonData() async {
    String jsonString = await rootBundle.loadString(widget.pokemonJsonPath);
    List<dynamic> pokemonList = json.decode(jsonString);
    setState(() {
      pokemonData = pokemonList
          .firstWhere((pokemon) => pokemon['id'] == '#${widget.pokemonId}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemonData['name'] ?? ''),
      ),
      body: pokemonData.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      pokemonData['imageurl'] ?? '',
                      width: 200,
                      height: 200,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'ID: ${pokemonData['id']}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  // Otros campos de datos aquí
                ],
              ),
            ),
    );
  }
}
