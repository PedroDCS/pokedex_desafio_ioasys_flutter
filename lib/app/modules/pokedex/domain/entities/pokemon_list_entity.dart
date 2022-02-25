import 'pokemon_list_item_entity.dart';

class PokemonListEntity {
  int count;
  String next;
  String previous;
  List<PokemonListItemEntity> pokemons;

  PokemonListEntity({
    required this.count,
    required this.next,
    required this.previous,
    required this.pokemons,
  });
}
