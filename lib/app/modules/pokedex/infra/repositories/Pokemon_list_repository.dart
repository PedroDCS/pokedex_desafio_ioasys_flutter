import 'package:dio/dio.dart';
import '../../domain/entities/pokemon_list_entity.dart';
import '../../domain/repositories/pokemon_list_repository_interface.dart';
import 'models/pokemon_list_model.dart';

class PokemonListRepository extends IPokemonListRepository {
  final Dio _dio = Dio();

  @override
  Future<PokemonListEntity> getPokemonList({required String link}) async {
    final _response = await _dio.get(link);
    return PokemonListModel.fromJson(_response.data);
  }
}
