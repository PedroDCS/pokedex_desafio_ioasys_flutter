import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/domain/models/pokemon_list_item_model.dart';

import '../../../../domain/models/pokemon_list_model.dart';
import '../../../../infra/repositories/Pokemon_list_repository.dart';

enum typeSearch { search, normal }

class HomeController {
  final _repository = PokemonListRepository();
  var link = "https://pokeapi.co/api/v2/pokemon?limit=15";
  PokemonListModel allpokemon = PokemonListModel();
  String searchh = '';

  setsearchh(s) {
    searchh = s;
  }

  Future<PokemonListModel> getPokemonList(linkArg) async {
    if (searchh.isEmpty) {
      linkArg ??= link;
      link = linkArg;

      var result = await _repository
          .fetchPokemonListData(linkArg)
          .onError((error, stackTrace) => throw Error());

      return result;
    } else {
      return search(searchh);
    }
  }

  Future<PokemonListModel> search(String search) async {
    allpokemon = await _repository
        .fetchPokemonListData("https://pokeapi.co/api/v2/pokemon?limit=1500")
        .onError((error, stackTrace) => throw Error());

    List<PokemonListItem> listAux = [];
    PokemonListModel searchpokemon = allpokemon;

    allpokemon.results!.forEach((element) {
      if (element.name!.contains(search)) {
        listAux.add(element);
      }
    });
    searchpokemon.results = listAux;
    return searchpokemon;
  }
}
