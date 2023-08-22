import 'package:second_app/domain/domain.dart';

class PokemonsRepositoryImpl implements PokemonsRepository {

  final PokemonsDataSource _dataSource;

  PokemonsRepositoryImpl(this._dataSource);
  @override
  Future<(Pokemon?, String)> getPokemon(String id) async {
    return await _dataSource.getPokemon(id);
  }
}