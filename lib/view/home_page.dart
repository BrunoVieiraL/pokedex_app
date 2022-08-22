import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:poke_app/model/pokemon_model.dart';
import 'package:poke_app/view/details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  var pokeHub = PokeModel(pokemon: []);

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var client = http.Client();
    try {
      var response = await http.get(Uri.parse(url));
      var decodedResponse = jsonDecode(response.body);
      pokeHub = PokeModel.fromJson(decodedResponse);
    } finally {
      client.close();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          children: pokeHub.pokemon
              .map((pkmn) => Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailPage(
                                pokemon: pkmn,
                              );
                            },
                          ),
                        );
                      },
                      child: Hero(
                        tag: pkmn.img,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Image(
                                  image: NetworkImage(pkmn.img),
                                ),
                              ),
                              Text(
                                pkmn.name,
                                softWrap: false,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ))
              .toList()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchData();
        },
        child: const Icon(Icons.refresh),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}
