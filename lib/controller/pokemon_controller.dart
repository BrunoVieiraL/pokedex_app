import 'dart:convert';

import '../model/pokemon_model.dart';
import 'package:http/http.dart' as http;

class PokemonController {
  call() async {
    String url =
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
    var client = http.Client();
    try {
      var response = await http.get(Uri.parse(url));
      var decodedResponse = jsonDecode(response.body);
      PokeModel pokeList = PokeModel.fromJson(decodedResponse);
      return pokeList;
    } finally {
      client.close();
    }
  }
}
