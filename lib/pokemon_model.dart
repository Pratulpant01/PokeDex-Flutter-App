// ignore_for_file: public_member_api_docs, sort_constructors_first
class PokemonModel {
  final String name;
  final int id;
  final String? url;

  String get imageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  PokemonModel({
    required this.name,
    this.id = 0,
    this.url,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
        name: json['name'] as String,
        url: json['url'] as String,
        id: int.parse(json['url'].split('/')[6]));
  }

  @override
  String toString() => 'PokemonModel(name: $name, id: $id, url: $url)';
}

class PokemonPageResponse {
  final List<PokemonModel> pokemonListings;
  final bool canLoadNextPage;
  PokemonPageResponse({
    required this.pokemonListings,
    required this.canLoadNextPage,
  });

  factory PokemonPageResponse.fromJson(Map<String, dynamic> json) {
    final canLoadNextPage = json['next'] != null;
    final pokemonListings = (json['results'] as List)
        .map((listingJson) => PokemonModel.fromJson(listingJson))
        .toList();
    return PokemonPageResponse(
      pokemonListings: pokemonListings,
      canLoadNextPage: canLoadNextPage,
    );
  }
}
