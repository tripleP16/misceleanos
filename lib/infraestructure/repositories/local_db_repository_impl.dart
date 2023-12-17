import 'package:second_app/domain/datasources/local_db_datasource.dart';
import 'package:second_app/domain/entities/pokemon.dart';
import 'package:second_app/domain/repositories/local_db_repository.dart';
import 'package:second_app/infraestructure/datasources/isar_local_db_datasource.dart';

class LocalDbRepositoryImpl implements LocalDbRepository {
  final LocalDbDatasource _localDbDataSource;

  LocalDbRepositoryImpl([LocalDbDatasource? localDbDataSource])
      : _localDbDataSource = localDbDataSource ?? IsarLocalDbDatasource();

  @override
  Future<List<Pokemon>> getPokemons() {
    return _localDbDataSource.getPokemons();
  }

  @override
  Future<void> insertPokemon(Pokemon pokemon) {
    return _localDbDataSource.insertPokemon(pokemon);
  }

  @override
  Future<int> pokemonCount() {
    return _localDbDataSource.pokemonCount();
  }
}
