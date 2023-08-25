import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/config/config.dart';
import 'package:second_app/domain/domain.dart';
import 'package:second_app/presentation/providers/providers.dart';

class PokemonScreen extends ConsumerWidget {
  final String pokemonId;
  const PokemonScreen({super.key, required this.pokemonId});

  @override
  Widget build(BuildContext context, ref) {
    final pokemonAsync$ = ref.watch(pokemonProvider(pokemonId));
    return pokemonAsync$.when(
        data: (value) => _PokemonView(pokemon: value),
        error: (error, stackTrace) =>
            _ErrorWidget(errorMessage: error.toString()),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}

class _PokemonView extends StatelessWidget {
  final Pokemon pokemon;

  const _PokemonView({required this.pokemon});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        actions: [
          IconButton(
              onPressed: () {
                SharePlugin.shareLink(
                    pokemon.sprinteFront, 'Mira este pokemon');
              },
              icon: Icon(Icons.share_outlined))
        ],
      ),
      body: Center(
          child: Image.network(
        pokemon.sprinteFront,
        fit: BoxFit.contain,
        width: 150,
        height: 150,
      )),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  final String errorMessage;

  const _ErrorWidget({required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(errorMessage)),
    );
  }
}
