import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/data/api.dart';
import 'package:pokedex/blocs/Pokemon%20Bloc/pokemon_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        title: Text('PokeDex', style: GoogleFonts.aclonica()),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          } else if (state is PokemonLoaded) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: state.pokemonListing.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: GridTile(
                        child: Column(
                      children: [
                        Image.network(state.pokemonListing[index].imageUrl),
                        Text(
                          state.pokemonListing[index].name.toUpperCase(),
                          style: GoogleFonts.abel(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )),
                  );
                });
          } else if (state is PokemonLoadingError) {
            return Center(
              child: Text(state.error.toString()),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
