// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonLoaded extends PokemonState {
  final List<PokemonModel> pokemonListing;
  final bool canLoadNextPage;
  PokemonLoaded({
    required this.pokemonListing,
    required this.canLoadNextPage,
  });
}

class PokemonLoadingError extends PokemonState {
  final Error error;
  PokemonLoadingError({
    required this.error,
  });
}
