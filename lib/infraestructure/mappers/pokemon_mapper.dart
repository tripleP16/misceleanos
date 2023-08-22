import 'package:second_app/infraestructure/models/pokeapi_pokemon_response.dart';

import '../../domain/domain.dart';

class PokemonMapper {
  static Pokemon pokeResponseToEntity(Map<String, dynamic> json) {
    final pokeResponse = PokemonResponse.fromJson(json);
    return Pokemon(
      id: pokeResponse.id,
      name: pokeResponse.name ,
      sprinteFront: pokeResponse.sprites.frontDefault,
    );
  }
}