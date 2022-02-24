class PokemonSpecieModel {
  String? flavor_text;
  PokemonSpecieModel({
    this.flavor_text,
  });

  PokemonSpecieModel.fromJson(Map<String, dynamic> json) {
    var textAux = json['flavor_text_entries'];
    String flavorTextAux = '';
    //pode ser mais bem feito, mas por enquanto vai desse jeito

    textAux.forEach((v) {
      if (v['language']['name'] == 'en') {
        flavorTextAux = v['flavor_text'];
      }
    });

    flavor_text = flavorTextAux
        .toString()
        .replaceAll(RegExp(r'\n'), ' ')
        .replaceAll(RegExp(r'\f'), ' ')
        .replaceAll(RegExp(r'\r'), ' ')
        .replaceAll(RegExp(r'\v'), ' ')
        .replaceAll(RegExp(r'\t'), ' ');
  }
}

class FlavorText {
  String? flavorText;
  List? language;
  List? version;
}
