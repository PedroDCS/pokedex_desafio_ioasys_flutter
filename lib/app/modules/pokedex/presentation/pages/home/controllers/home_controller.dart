import '../../../../domain/models/pokemon_list_item_model.dart';
import '../../../../domain/models/pokemon_list_model.dart';
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

  Future<PokemonListModel> getPokemonListRepository(String link) async {
    return await _repository
        .fetchPokemonListData(link)
        .onError((error, stackTrace) => throw Error());
  }

  Future<PokemonListModel> getPokemonList(_linkInitArg) async {
    if (_searchPokemon.isEmpty) {
      _linkInitArg ??= _linkInit;
      _linkInit = _linkInitArg;
      return await getPokemonListRepository(_linkInitArg);
    } else {
      return searchPokemon(_searchPokemon);
    }
  }

  Future<PokemonListModel> searchPokemon(String search) async {
    PokemonListModel _allPokemonListSearch = await getPokemonListRepository(
        "https://pokeapi.co/api/v2/pokemon?limit=1500");
    List<PokemonListItem> listPokemonMatchSearch = [];

    _allPokemonListSearch.results!.forEach((element) {
      if (element.name!.contains(search)) {
        listPokemonMatchSearch.add(element);
      }
    });

    _allPokemonListSearch.results = listPokemonMatchSearch;
    return _allPokemonListSearch;
  }
}
