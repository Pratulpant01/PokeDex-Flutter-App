// ignore_for_file: public_member_api_docs, sort_constructors_first
class PokemonSpeciesInfoResponse {
  final String description;

  PokemonSpeciesInfoResponse({
    required this.description,
  });

  factory PokemonSpeciesInfoResponse.fromJson(Map<String, dynamic> json) {
    return PokemonSpeciesInfoResponse(
      description: json['flavor_text_entries'][0]['flavor_text'],
    );
  }
}
