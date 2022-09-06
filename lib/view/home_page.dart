import 'package:flutter/material.dart';
import 'package:poke_app/controller/pokemon_controller.dart';
import 'package:poke_app/model/pokemon_model.dart';
import 'package:poke_app/view/details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _pokeList = PokeModel(pokemon: []);

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    _pokeList = await PokemonController().call();
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
          children: _pokeList.pokemon
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
          getData();
        },
        child: const Icon(Icons.refresh),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}
