import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/domain/models/pokemon_specie_model.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/infra/repositories/pokemon_details_repository.dart';

class PokemonDetailsController {
  final _repository = PokemonDetailsRepository();

  Future<PokemonSpecieModel> getPokemonDetails(String linkArg) async {
    var result = await _repository
        .fetchPokemonDetailsData(linkArg)
        .onError((error, stackTrace) => throw Error());

    return result;
  }
}
