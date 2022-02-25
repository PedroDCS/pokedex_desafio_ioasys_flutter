import '../../domain/entities/pokemon_entity.dart';

import '../../infra/repositories/pokemon_repositorie.dart';

class PokemonItemController {
  final _repository = PokemonRepository();

  Future<PokemonEntity> getPokemon({required String pokemon}) async {
    var result = await _repository
        .fetchPokemonData(pokemon: pokemon)
        .onError((error, stackTrace) => throw Error());
    return result;
  }
}
