import 'pokemon_list_item_model.dart';

class PokemonListModel {
  int? count;
  String? next;
  String? previous;
  List<PokemonListItem>? results;

  PokemonListModel({this.count, this.next, this.previous, this.results});

  PokemonListModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <PokemonListItem>[];
      json['results'].forEach((v) {
        results!.add(PokemonListItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'PokemonListModel(count: $count, next: $next, previous: $previous, results: $results)';
  }
}
