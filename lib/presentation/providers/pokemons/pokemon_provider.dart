import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/domain/domain.dart';
import 'package:second_app/infraestructure/infraestructure.dart';

final pokemonRepositoryProvider = Provider<PokemonsRepository>((ref) {
  return PokemonsRepositoryImpl(PokemonsDatasourceImpl());
});

final pokemonProvider = FutureProvider.family<Pokemon, String>((ref, id) async {
  final pokemonRepository = ref.watch(pokemonRepositoryProvider);

  final (pokemon, error) = await pokemonRepository.getPokemon(id);

  if (pokemon != null) return pokemon;

  throw error;
});
