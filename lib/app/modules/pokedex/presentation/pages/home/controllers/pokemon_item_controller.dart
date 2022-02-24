import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/domain/models/pokemon_model.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/infra/repositories/pokemon_repositorie.dart';

class PokemonItemController {
  final _repository = PokemonRepository();

  Future<PokemonModel> getPokemon({required String pokemon}) async {
    var result = await _repository
        .fetchPokemonData(pokemon: pokemon)
        .onError((error, stackTrace) => throw Error());
    return result;
  }
}
