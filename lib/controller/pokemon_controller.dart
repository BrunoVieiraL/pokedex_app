import 'dart:convert';

import '../model/pokemon_model.dart';
import 'package:http/http.dart' as http;

class PokemonController {
  var pokeList = PokeModel(pokemon: []);

  call() async {
    String url =
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
    var client = http.Client();
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        return pokeList = PokeModel.fromJson(decodedResponse);
      }
    } finally {
      client.close();
    }
  }
}
