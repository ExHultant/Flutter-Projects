import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokeapi/models/pokemon.dart';

class PokemonService {
  Future<List<Pokemon>> fetchPokemonList() async {
    final response = await http.get(
        Uri.parse('https://pokeapi.co/api/v2/pokemon?offset=151&limit=100'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      List<Pokemon> pokemonList = [];
      for (var item in data['results']) {
        final pokemonResponse = await http.get(Uri.parse(item['url']));
        if (pokemonResponse.statusCode == 200) {
          final pokemonData = json.decode(pokemonResponse.body);
          pokemonList.add(Pokemon.fromMap(pokemonData, pokemonData['name']));
        }
      }
      return pokemonList;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
