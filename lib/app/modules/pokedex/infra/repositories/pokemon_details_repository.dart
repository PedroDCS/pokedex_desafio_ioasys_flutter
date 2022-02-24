import 'package:dio/dio.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/domain/models/pokemon_list_model.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/domain/models/pokemon_specie_model.dart';

class PokemonDetailsRepository {
  final Dio _dio = Dio();

  Future<PokemonSpecieModel> fetchPokemonDetailsData(String link) async {
    final _response = await _dio.get(link);
    return PokemonSpecieModel.fromJson(_response.data);
  }
}
