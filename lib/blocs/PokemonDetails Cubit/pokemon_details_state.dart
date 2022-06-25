// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pokemon_details_cubit.dart';

@immutable
abstract class PokemonDetailsState {}

class PokemonDetailsInitial extends PokemonDetailsState {}

class PokemonDetailsLoaded extends PokemonDetailsState {
  final String name;
  final String description;
  final int id;
  final String imgUrl;
  final List<String> types;
  final int weight;
  final int height;
  PokemonDetailsLoaded({
    required this.name,
    required this.description,
    required this.id,
    required this.imgUrl,
    required this.types,
    required this.weight,
    required this.height,
  });
}
