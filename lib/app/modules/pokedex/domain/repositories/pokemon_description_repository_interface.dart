import '../entities/pokemon_desc_entity.dart';

abstract class IPokemonDescriptionRepository {
  Future<PokemonDescriptionEntity> fetchPokemonData({required String link});
}
