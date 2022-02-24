class PokemonListItem {
  String? name;
  String? url;

  PokemonListItem({this.name, this.url});

  PokemonListItem.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }

  static List<PokemonListItem> fromJsonList(List<dynamic>? json) =>
      json?.map((item) => PokemonListItem.fromJson(item)).toList() ?? [];

  @override
  String toString() => 'PokemonListItem(name: $name, url: $url)';
}
