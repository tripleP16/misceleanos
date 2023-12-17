import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:second_app/domain/datasources/local_db_datasource.dart';
import 'package:second_app/domain/entities/pokemon.dart';

class IsarLocalDbDatasource extends LocalDbDatasource {
  late Future<Isar> db;

  IsarLocalDbDatasource() {
    db = openIsar();
  }

  @override
  Future<List<Pokemon>> getPokemons() {
    // TODO: implement getPokemons
    throw UnimplementedError();
  }

  @override
  Future<void> insertPokemon(Pokemon pokemon) {
    // TODO: implement insertPokemon
    throw UnimplementedError();
  }

  @override
  Future<int> pokemonCount() {
    // TODO: implement pokemonCount
    throw UnimplementedError();
  }

  Future<Isar> openIsar() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([PokemonSchema], directory: dir.path);
    }

    return Future.value(Isar.getInstance());
  }
}
