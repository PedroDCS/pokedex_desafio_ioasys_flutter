import '../../../../domain/models/pokemon_list_model.dart';
import '../../../../infra/repositories/Pokemon_list_repository.dart';

class HomeController {
  final _repository = PokemonListRepository();
  var link = "https://pokeapi.co/api/v2/pokemon?limit=15";

  Future<PokemonListModel> getPokemonList(linkArg) async {
    linkArg ??= link;
    link = linkArg;

    var result = await _repository
        .fetchPokemonListData(linkArg)
        .onError((error, stackTrace) => throw Error());

    return result;
  }
}
