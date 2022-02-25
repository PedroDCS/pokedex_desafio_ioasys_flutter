import '../../../domain/entities/pokemon_entity.dart';
import '../../../domain/entities/pokemon_stats_entity.dart';
import '../../../domain/entities/pokemon_moves_entity.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel(
      {required int weight,
      required int height,
      required int id,
      required String name,
      required String sprite,
      required String url,
      required String specie,
      required List<PokemonMoveEntity> moves,
      required List<PokemonStatsEntity> status,
      required List<String> types})
      : super(
            weight: weight,
            height: height,
            id: id,
            name: name,
            sprite: sprite,
            url: url,
            specie: specie,
            moves: moves,
            status: status,
            types: types);

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    List<PokemonMoveEntity> movesAux = [];
    List<PokemonStatsEntity> statusAux = [];
    List<String> typesAux = [];

    if (json['moves'].length == 0) {
      movesAux.add(PokemonMoveEntity(name: "have no move", url: "null"));
      movesAux.add(PokemonMoveEntity(name: "have no move", url: "null"));
    } else {
      json['moves'].forEach((m) {
        movesAux.add(
            PokemonMoveEntity(name: m['move']['name'], url: m['move']['url']));
      });
    }

    json['stats'].forEach((s) {
      statusAux.add(
        PokemonStatsEntity(name: s['stat']['name'], value: s['base_stat']),
      );
    });

    json['types'].forEach((t) {
      typesAux.add(t['type']['name']);
    });

    return PokemonModel(
      id: json['id'],
      weight: json['weight'],
      height: json['height'],
      name: json['name'] ?? '',
      url: "https://pokeapi.co/api/v2/pokemon/${json['id']}",
      moves: movesAux,
      status: statusAux,
      types: typesAux,
      sprite: json['sprites']['other']['official-artwork']['front_default'] ??
          json['sprites']['front_default'] ??
          json['sprites']['versions']['generation-viii']['icons']
              ['front_default'],
      specie: json['species']['url'],
    );
  }
}
