import 'package:pokedex/pokedex.dart';

Future<void> main() async {
  final pokedex = Pokedex();

  pokedex.pokemonSpecies.get(id: 1).then((aegislashSpecies) {
    print(aegislashSpecies);
  });
  // get by url
}
