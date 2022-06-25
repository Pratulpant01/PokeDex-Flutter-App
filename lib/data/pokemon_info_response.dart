// ignore_for_file: public_member_api_docs, sort_constructors_first
class PokemonInfoResponse {
  final String name;
  final int id;
  final String imgUrl;
  final List<String> types;
  final int weight;
  final int height;

  PokemonInfoResponse({
    required this.name,
    required this.id,
    required this.imgUrl,
    required this.types,
    required this.weight,
    required this.height,
  });

  factory PokemonInfoResponse.fromJson(Map<String, dynamic> json) {
    final type = (json['types'] as List)
        .map(
          (typeJson) => typeJson['type']['name'] as String,
        )
        .toList();
    return PokemonInfoResponse(
      name: json['name'],
      id: json['id'],
      imgUrl: json['sprites']['front_default'],
      types: type,
      weight: json['weight'],
      height: json['height'],
    );
  }
}
