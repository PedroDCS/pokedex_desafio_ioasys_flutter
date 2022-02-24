import 'package:hive/hive.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/domain/models/pokemon_model.dart';
import 'package:pokedex_desafio_ioasys_flutter/app/modules/pokedex/infra/repositories/pokemon_repositorie.dart';

class FavoritesController {
  final _repository = PokemonRepository();

  Future<PokemonModel> getPokemon({required int pokemon}) async {
    var result = await _repository
        .fetchPokemonData(pokemon: pokemon.toString())
        .onError((error, stackTrace) => throw Error());
    return result;
  }

  List<int> listPokemonIndex = [];

  getData() async {
    var listBox = await Hive.openBox("pokemons");
    var getPokeList = await listBox.get('pokemonList');
    listPokemonIndex = getPokeList ?? [];

    //Hive.close();
  }

  Future<void> addRemoveFavorite({required int index}) async {
    var listBox = await Hive.openBox("pokemons");
    var getPokeList = await listBox.get('pokemonList');
    listPokemonIndex = getPokeList ?? [];

    var isOnList = listPokemonIndex.indexWhere((element) => element == index);

    if (isOnList >= 0) {
      removedIdFromList(index);
    } else {
      addIdList(index: index);
    }

    await listBox.put('pokemonList', listPokemonIndex);
    //Hive.close();
  }

  void addIdList({required int index}) {
    listPokemonIndex.add(index);
  }

  void removedIdFromList(int index) {
    listPokemonIndex.remove(index);
  }
}
