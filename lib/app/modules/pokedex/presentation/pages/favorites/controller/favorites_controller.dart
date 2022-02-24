import 'package:hive/hive.dart';
import '../../../../domain/models/pokemon_model.dart';
import '../../../../infra/repositories/pokemon_repositorie.dart';

class FavoritesController {
  final _repository = PokemonRepository();
  List<int> listPokemonID = [];

  Future<PokemonModel> getFavoritePokemon({required pokemonID}) async {
    var result = await _repository
        .fetchPokemonData(pokemon: pokemonID.toString())
        .onError((error, stackTrace) => throw Error());
    return result;
  }

  getFavoritesPokemonList() async {
    var hivePokemonBox = await Hive.openBox("pokemons");
    var hivePokemonindexList =
        await hivePokemonBox.get('pokemonFavoritesIDList');
    listPokemonID = hivePokemonindexList ?? [];
    Hive.close();
  }

  Future<void> addRemovePokemonFavorite({required int pokemonID}) async {
    var hivePokemonBox = await Hive.openBox("pokemons");
    var hivePokemonindexList =
        await hivePokemonBox.get('pokemonFavoritesIDList');
    listPokemonID = hivePokemonindexList ?? [];

    var isPokemonOnList = listPokemonID.indexWhere((id) => id == pokemonID);

    if (isPokemonOnList >= 0) {
      listPokemonID.remove(pokemonID);
    } else {
      listPokemonID.add(pokemonID);
    }

    await hivePokemonBox.put('pokemonFavoritesIDList', listPokemonID);
    Hive.close();
  }
}
