import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/domain/entities/pokemon.dart';
import 'package:second_app/infraestructure/repositories/local_db_repository_impl.dart';

final pokemonDbProvider =
    FutureProvider.autoDispose<List<Pokemon>>((ref) async {
  final localDb = LocalDbRepositoryImpl();
  final pokemons = await localDb.getPokemons();

  return pokemons;
});
