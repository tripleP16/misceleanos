import 'package:second_app/domain/domain.dart';

abstract class LocalDbRepository {
  Future<List<Pokemon>> getPokemons();
  Future<int> pokemonCount();
  Future<void> insertPokemon(Pokemon pokemon);
}
