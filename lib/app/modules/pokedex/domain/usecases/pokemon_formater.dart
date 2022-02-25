class PokemonFormatter {
  String formatNumber(String number) {
    var auxNumber = double.tryParse(number);
    if (auxNumber == null || auxNumber == double.nan) {
      return "XXX";
    } else if (auxNumber < 10) {
      return "00$number";
    } else if (auxNumber < 100) {
      return "0$number";
    } else {
      return number;
    }
  }

  String formatName(String name) {
    name = name.replaceAll("-", " ");
    return '${name.substring(0, 1).toUpperCase()}${name.substring(1)}';
  }

  String formatStsName(String status) {
    switch (status) {
      case 'hp':
        return "HP";
      case 'attack':
        return "ATK";
      case 'defense':
        return "DEF";
      case 'special-attack':
        return "SATK";
      case 'special-defense':
        return "SDEF";
      case 'speed':
        return "SPD";
      default:
        return "--";
    }
  }
}
