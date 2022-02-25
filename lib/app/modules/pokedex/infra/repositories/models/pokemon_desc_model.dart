import '../../../domain/entities/pokemon_desc_entity.dart';

class PokemonDescriptionModel extends PokemonDescriptionEntity {
  PokemonDescriptionModel({required String flavortext})
      : super(flavortext: flavortext);

  factory PokemonDescriptionModel.fromJson(Map<String, dynamic> json) {
    var textAux = json['flavor_text_entries'];
    String flavorTextAux = '';
    //pode ser mais bem feito, mas por enquanto vai desse jeito

    //vai pegar a ultima descrição em ingles que encontrar do pokemon
    textAux.forEach((v) {
      if (v['language']['name'] == 'en') {
        flavorTextAux = v['flavor_text'];
      }
    });

    return PokemonDescriptionModel(
        flavortext: flavorTextAux
            .toString()
            .replaceAll(RegExp(r'\n'), ' ')
            .replaceAll(RegExp(r'\f'), ' ')
            .replaceAll(RegExp(r'\r'), ' ')
            .replaceAll(RegExp(r'\v'), ' ')
            .replaceAll(RegExp(r'\t'), ' '));
  }
}
