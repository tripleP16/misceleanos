import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/presentation/providers/providers.dart';

class PokemonScreen extends ConsumerWidget {
  final String pokemonId;
  const PokemonScreen({super.key, required this.pokemonId});

  @override
  Widget build(BuildContext context, ref) {
    final pokemonAsync$ = ref.watch(pokemonProvider(pokemonId));
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon ${pokemonAsync$}'),
      ),
      body: Center(
        child: Text(pokemonId),
      ),
    );
  }
}
