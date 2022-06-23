// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonEvent {}

class PokemonPageRequestEvent extends PokemonEvent {
  final int page;
  PokemonPageRequestEvent({
    required this.page,
  });
}
