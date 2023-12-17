import 'package:flutter/material.dart';
import 'package:second_app/config/workmanager/callback_dispatcher.dart';
import 'package:second_app/domain/domain.dart';
import 'package:workmanager/workmanager.dart';

class DbPokemonsScreen extends StatelessWidget {
  const DbPokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        slivers: [_PokemonsGrid(pokemons: [])],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Activar fetch periodico'),
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
