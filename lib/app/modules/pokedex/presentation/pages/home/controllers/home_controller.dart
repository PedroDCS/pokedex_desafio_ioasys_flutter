import '../../../../domain/entities/pokemon_list_entity.dart';
import '../../../../domain/entities/pokemon_list_item_entity.dart';

import '../../../../infra/repositories/Pokemon_list_repository.dart';

enum typeSearch { search, normal }

class HomeController {
  final _repository = PokemonListRepository();
  var _linkInit = "https://pokeapi.co/api/v2/pokemon?limit=15";

  String _searchPokemon = '';

  getLinkInitial() {
    return _linkInit;
  }

  setSearchPokemon(s) {
    _searchPokemon = s;
  }

  Future<PokemonListEntity> getPokemonListRepository(String link) async {
    return await _repository
        .getPokemonList(link: link)
        .onError((error, stackTrace) => throw Error());
  }

  Future<PokemonListEntity> getPokemonList(_linkInitArg) async {
    if (_searchPokemon.isEmpty) {
      _linkInitArg ??= _linkInit;
      _linkInit = _linkInitArg;
      return await getPokemonListRepository(_linkInitArg);
    } else {
      return searchPokemon(_searchPokemon);
    }
  }

  Future<PokemonListEntity> searchPokemon(String search) async {
    PokemonListEntity _allPokemonListSearch = await getPokemonListRepository(
        "https://pokeapi.co/api/v2/pokemon?limit=1500");
    List<PokemonListItemEntity> listPokemonMatchSearch = [];

    _allPokemonListSearch.pokemons.forEach((element) {
      if (element.name.contains(search)) {
        listPokemonMatchSearch.add(element);
      }
    });

    _allPokemonListSearch.pokemons = listPokemonMatchSearch;
    return _allPokemonListSearch;
  }
}
