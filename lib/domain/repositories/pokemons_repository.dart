import 'package:second_app/domain/domain.dart';

abstract class PokemonsRepository {
  Future<(Pokemon?, String)> getPokemon(String id);

}
