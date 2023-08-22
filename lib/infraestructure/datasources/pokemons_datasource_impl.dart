import 'package:dio/dio.dart';
import 'package:second_app/domain/domain.dart';
import 'package:second_app/infraestructure/mappers/pokemon_mapper.dart';

class PokemonsDatasourceImpl implements PokemonsDataSource {
  final Dio _dio;

  PokemonsDatasourceImpl()
      : _dio = Dio(BaseOptions(
          baseUrl: 'https://pokeapi.co/api/v2/',
        ));

  @override
  Future<(Pokemon?, String)> getPokemon(String id) async {
    try {
      final resp = await _dio.get('pokemon/$id');
      final pokemon = PokemonMapper.pokeResponseToEntity(resp.data);
      return (pokemon, 'Data obtenida correctamente');
    } catch (e) {
      return (null, 'No se pudo obtener el pokemon');
    }
  }
}
