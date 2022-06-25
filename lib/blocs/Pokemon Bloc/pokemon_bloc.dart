import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedex/data/api.dart';
import 'package:pokedex/data/pokemon_model.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _apiservice = ApiService();
  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonPageRequestEvent>((event, emit) async {
      try {
        emit(PokemonLoading());
        final pokemonPageResponse =
            await _apiservice.getPokemonPage(event.page);
        emit(
          PokemonLoaded(
            pokemonListing: pokemonPageResponse.pokemonListings,
            canLoadNextPage: pokemonPageResponse.canLoadNextPage,
          ),
        );
      } on Error catch (e) {
        emit(PokemonLoadingError(error: e));
      }

      // TODO: implement event handler
    });
  }
}
