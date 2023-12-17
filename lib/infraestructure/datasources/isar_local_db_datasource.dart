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
  Future<List<Pokemon>> getPokemons() async {
    final isar = await db;
    return isar.pokemons.where().findAll();
  }

  @override
  Future<void> insertPokemon(Pokemon pokemon) async {
    final isar = await db;
    final done = isar.writeTxnSync(() => isar.pokemons.putSync(pokemon));
    print('Insert done: $done');
  }

  @override
  Future<int> pokemonCount() async {
    final isar = await db;
    return isar.pokemons.count();
  }

  Future<Isar> openIsar() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([PokemonSchema], directory: dir.path);
    }

    return Future.value(Isar.getInstance());
  }
}
