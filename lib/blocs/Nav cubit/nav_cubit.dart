import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedex/blocs/PokemonDetails%20Cubit/pokemon_details_cubit.dart';

part 'nav_state.dart';

// We are using int type inside cubit because we need to pass the id to fetch for data from an api.

class NavCubit extends Cubit<int?> {
  PokemonDetailsCubit pokemonDetailsCubit;
  NavCubit({required this.pokemonDetailsCubit}) : super(null);
  void showPokemonDetails(int pokemonId) {
    pokemonDetailsCubit.getPokemonDetails(pokemonId);
    emit(pokemonId);
  }

  void popToPokedex() {
    emit(null);
  }
}
