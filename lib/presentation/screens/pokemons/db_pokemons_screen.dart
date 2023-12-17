import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/config/workmanager/callback_dispatcher.dart';
import 'package:second_app/domain/domain.dart';
import 'package:second_app/presentation/providers/background_tasks/background_tasks_provider.dart';
import 'package:second_app/presentation/providers/pokemons/pokemon_db_provider.dart';
import 'package:workmanager/workmanager.dart';

class DbPokemonsScreen extends ConsumerWidget {
  const DbPokemonsScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final pokemonsAsync = ref.watch(pokemonDbProvider);
    final isBackgroundFetchActive = ref.watch(backgroundPokemonFetchProvider);

    if (pokemonsAsync.isLoading) {
      return const Scaffold(
          body: Center(
        child: CircularProgressIndicator(),
      ));
    }

    final List<Pokemon> pokemons = pokemonsAsync.value ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('Background process'),
        actions: [
          IconButton(
              icon: Icon(Icons.add_alarm_sharp),
              onPressed: () {
                Workmanager().registerOneOffTask(
                    fetchBackgroundTaskKey, fetchBackgroundTaskKey,
                    initialDelay: const Duration(seconds: 3),
                    inputData: {'howMany': 30});
              })
        ],
      ),
      body: CustomScrollView(
        slivers: [_PokemonsGrid(pokemons: pokemons)],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ref.read(backgroundPokemonFetchProvider.notifier).toggleProcess();
        },
        label: Text(!isBackgroundFetchActive!
            ? 'Activar fetch periodico'
            : 'Desactivar fetch periodico'),
        icon: Icon(Icons.av_timer),
      ),
    );
  }
}

class _PokemonsGrid extends StatelessWidget {
  final List<Pokemon> pokemons;
  const _PokemonsGrid({super.key, required this.pokemons});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 3,
          mainAxisSpacing: 2,
        ),
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          final pokemon = pokemons[index];
          return Column(
            children: [
              Image.network(
                pokemon.sprinteFront,
                fit: BoxFit.contain,
              ),
              Text(pokemon.name)
            ],
          );
        });
  }
}
