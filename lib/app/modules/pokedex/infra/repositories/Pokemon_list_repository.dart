import 'package:dio/dio.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/domain/models/pokemon_list_model.dart';

class PokemonListRepository {
  final Dio _dio = Dio();

  Future<PokemonListModel> fetchPokemonListData(String link) async {
    final _response = await _dio.get(link);
    return PokemonListModel.fromJson(_response.data);
  }
}
