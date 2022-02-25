import '../../../../domain/entities/pokemon_desc_entity.dart';

import '../../../../infra/repositories/pokemon_details_repository.dart';

class PokemonDetailsController {
  final _repository = PokemonDescriptionRepository();

  Future<PokemonDescriptionEntity> getPokemonSpecie(String linkArg) async {
    var result = await _repository
        .fetchPokemonData(link: linkArg)
        .onError((error, stackTrace) => throw Error());

    return result;
  }
}
