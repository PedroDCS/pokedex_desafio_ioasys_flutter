import 'package:dio/dio.dart';
import '../../domain/entities/pokemon_entity.dart';
import '../../domain/repositories/pokemon_repository_interface.dart';
import 'models/pokemon_model.dart';

class PokemonRepository extends IPokemonRepository {
  final Dio _dio = Dio();

  @override
  Future<PokemonEntity> fetchPokemonData({required String pokemon}) async {
    final response =
        await _dio.get("https://pokeapi.co/api/v2/pokemon/$pokemon");
    return PokemonModel.fromJson(response.data);
  }
}
