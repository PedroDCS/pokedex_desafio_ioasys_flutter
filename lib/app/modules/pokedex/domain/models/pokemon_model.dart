class PokemonModel {
  final String weight;
  final String height;
  final String id;
  final String name;
  final String sprite;
  final String url;
  final String specie;

  final List<Moves>? moves;
  final List<Stat>? status;
  final List<String>? types;

  PokemonModel({
    required this.weight,
    required this.height,
    required this.id,
    required this.name,
    required this.sprite,
    required this.url,
    required this.specie,
    this.moves,
    this.status,
    this.types,
  });

  factory PokemonModel.fromJson(json) {
    List<Moves> movesAux = [];
    List<Stat> statusAux = [];
    List<String> typesAux = [];

    json['moves'].forEach((m) {
      movesAux.add(Moves(m['move']['name'], m['move']['url']));
    });

    json['stats'].forEach((s) {
      statusAux.add(
        Stat(s['stat']['name'], s['base_stat'].toString()),
      );
    });

    json['types'].forEach((t) {
      typesAux.add(t['type']['name'].toString());
    });

    var poke = PokemonModel(
      id: json['id'].toString(),
      weight: json['weight'].toString(),
      height: json['height'].toString(),
      name: json['name'] ?? '',
      url: "https://pokeapi.co/api/v2/pokemon/${json['id']}",
      moves: movesAux,
      status: statusAux,
      types: typesAux,
      sprite:
          "https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/${json['id']}.svg",
      specie: json['species']['url'],
    );
    return poke;
  }

  @override
  String toString() {
    return 'PokemonModel(weight: $weight, height: $height, id: $id, name: $name, sprite: $sprite, url: $url, moves: $moves, status: $status, types: $types, specie: $specie)';
  }
}

class Moves {
  final String name;
  final String url;
  Moves(this.name, this.url);
  @override
  String toString() {
    return "$name, $url";
  }
}

class Stat {
  final String name;
  final String value;
  Stat(this.name, this.value);
  @override
  String toString() {
    return "$name, $value";
  }
}

class Type {
  final String slot;
  final String type;

  Type(this.slot, this.type);
  @override
  String toString() {
    return "$slot, $type";
  }
}
