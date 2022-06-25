import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedex/data/api.dart';
import 'package:pokedex/data/pokemon_info_response.dart';
import 'package:pokedex/data/pokemon_species.dart';

part 'pokemon_details_state.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetailsState> {
  final _apiService = ApiService();

  PokemonDetailsCubit() : super(PokemonDetailsInitial());

  void getPokemonDetails(int pokemonId) async {
    // response is a list of object, we have cast the info and species response below.

    final response = await Future.wait([
      _apiService.getPokemonInfo(pokemonId),
      _apiService.getPokemonSpeciesInfo(pokemonId)
    ]);
    final pokemonInfo = response[0] as PokemonInfoResponse;
    final speciesInfo = response[1] as PokemonSpeciesInfoResponse;
    emit(
      PokemonDetailsLoaded(
        name: pokemonInfo.name,
        description: speciesInfo.description,
        id: pokemonInfo.id,
        imgUrl: pokemonInfo.imgUrl,
        types: pokemonInfo.types,
        weight: pokemonInfo.weight,
        height: pokemonInfo.height,
      ),
    );
  }
}
