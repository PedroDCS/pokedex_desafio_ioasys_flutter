import '../entities/pokemon_entity.dart';

abstract class IPokemonRepository {
  Future<PokemonEntity> fetchPokemonData({required String pokemon});
}
