import 'package:dio/dio.dart';
import '../../domain/entities/pokemon_desc_entity.dart';
import '../../domain/repositories/pokemon_description_repository_interface.dart';

import 'models/pokemon_desc_model.dart';

class PokemonDescriptionRepository extends IPokemonDescriptionRepository {
  final Dio _dio = Dio();

  @override
  Future<PokemonDescriptionEntity> fetchPokemonData(
      {required String link}) async {
    final _response = await _dio.get(link);
    return PokemonDescriptionModel.fromJson(_response.data);
  }
}
