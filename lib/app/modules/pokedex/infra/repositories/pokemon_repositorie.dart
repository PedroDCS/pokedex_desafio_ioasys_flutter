import 'package:dio/dio.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/domain/models/pokemon_model.dart';

class PokemonRepository {
  final Dio _dio = Dio();

  Future fetchPokemonData({required String pokemon}) async {
    final response =
        await _dio.get("https://pokeapi.co/api/v2/pokemon/$pokemon");
    return PokemonModel.fromJson(response.data);
  }
}
