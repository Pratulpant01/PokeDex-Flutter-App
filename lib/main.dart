import 'package:flutter/material.dart';
import 'package:pokedex/blocs/Pokemon%20Bloc/pokemon_bloc.dart';
import 'package:pokedex/homeScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PokemonBloc()
              ..add(
                PokemonPageRequestEvent(page: 0),
              ),
          )
        ],
        child: HomeScreen(),
      ),
    );
  }
}
