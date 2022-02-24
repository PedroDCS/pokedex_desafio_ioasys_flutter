import '../../../../domain/models/pokemon_specie_model.dart';
import '../../../../infra/repositories/pokemon_details_repository.dart';

class PokemonDetailsController {
  final _repository = PokemonDetailsRepository();

  Future<PokemonSpecieModel> getPokemonSpecie(String linkArg) async {
    var result = await _repository
        .fetchPokemonDetailsData(linkArg)
        .onError((error, stackTrace) => throw Error());

    return result;
  }
}
