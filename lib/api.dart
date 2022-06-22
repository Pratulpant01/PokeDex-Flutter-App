import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/pokemon_model.dart';

class ApiService {
  List<PokemonModel> pokemonData = [];

  Future<void> getPokemonData() async {
    pokemonData = [];
    final url = 'https://pokeapi.co/api/v2/pokemon/?offset=50&limit=50';

    var response = await http.get(Uri.parse(url));

    var data = jsonDecode(response.body);
    var value = data['results'];

    if (response.statusCode == 200) {
      value.forEach(
        (element) {
          Map<String, dynamic> map = element;
          pokemonData.add(PokemonModel.fromJson(map));
        },
      );
      print(pokemonData);
    }
  }
}


      // value.forEach(
      //   (element) {
      //     if (element['name'] != null && element['url'] != null) {
      //       PokemonModel pokemonModel = PokemonModel(
      //         name: element['name'],
      //         url: element['url'],
      //         id: int.parse(element['url'].split('/')[6]),
      //       );
      //       pokemonData.add(pokemonModel);
      //     }
      //   },
      // );