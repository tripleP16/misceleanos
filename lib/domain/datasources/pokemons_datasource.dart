import 'package:second_app/domain/domain.dart';

abstract class PokemonsDataSource {
  Future<(Pokemon?, String)> getPokemon(String id);
  
}
