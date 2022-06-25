import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/data/pokemon_info_response.dart';
import 'package:pokedex/data/pokemon_model.dart';
import 'package:pokedex/data/pokemon_species.dart';

class ApiService {
  final baseurl = 'pokeapi.co';

  List<PokemonModel> pokemonData = [];

  Future<PokemonPageResponse> getPokemonPage(int pageIndex) async {
    final queryParameter = {
      'limit': '200',
      'offset': (pageIndex * 200).toString(),
    };
    final uri = Uri.https(baseurl, '/api/v2/pokemon/', queryParameter);
    final response = await http.Client().get(uri);
    final json = jsonDecode(response.body);
    return PokemonPageResponse.fromJson(json);
  }

  Future<PokemonInfoResponse> getPokemonInfo(int pokemonId) async {
    final uri = Uri.https(baseurl, '/api/v2/pokemon/$pokemonId');
    final response = await http.Client().get(uri);
    final json = jsonDecode(response.body);
    return PokemonInfoResponse.fromJson(json);
  }

  Future<PokemonSpeciesInfoResponse> getPokemonSpeciesInfo(
      int pokemonId) async {
    final uri = Uri.https(baseurl, '/api/v2/pokemon-species/$pokemonId');
    final response = await http.Client().get(uri);
    final json = jsonDecode(response.body);
    return PokemonSpeciesInfoResponse.fromJson(json);
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


      // Method 2

  //     Future<void> getPokemonData() async {
  //   pokemonData = [];
  //   final url = 'https://pokeapi.co/api/v2/pokemon?limit=100&offset=100';

  //   var response = await http.get(Uri.parse(url));

  //   var data = jsonDecode(response.body);
  //   var value = data['results'];

  //   if (response.statusCode == 200) {
  //     value.forEach(
  //       (element) {
  //         Map<String, dynamic> map = element;
  //         pokemonData.add(PokemonModel.fromJson(map));
  //       },
  //     );
  //     print(pokemonData);
  //   }
  // }