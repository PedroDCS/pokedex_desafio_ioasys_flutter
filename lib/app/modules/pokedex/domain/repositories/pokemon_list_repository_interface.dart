import '../entities/pokemon_list_entity.dart';

abstract class IPokemonListRepository {
  Future<PokemonListEntity> getPokemonList({required String link});
}
