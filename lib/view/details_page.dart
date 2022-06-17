import 'package:flutter/material.dart';
import 'package:poke_app/model/pokemon_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0,
        title: Text(pokemon.name),
      ),
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            left: 10,
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    image: NetworkImage(pokemon.img),
                  ),
                  Text('Altura: ${pokemon.height}'),
                  Text('Peso: ${pokemon.weight}'),
                  const Text('Tipos'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.values[5],
                    children: pokemon.type
                        .map((type) => FilterChip(
                              backgroundColor: Colors.green,
                              label: Text(
                                type,
                              ),
                              onSelected: (b) {},
                            ))
                        .toList(),
                  ),
                  const Text("Fraquezas"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses
                        .map((weak) => FilterChip(
                              backgroundColor: Colors.red,
                              label: Text(
                                weak,
                              ),
                              onSelected: (b) {},
                            ))
                        .toList(),
                  ),
                  const Text("Próxima Evolução"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: pokemon.nextEvolution!
                        .map((nextEvo) => FilterChip(
                              backgroundColor: Colors.amber,
                              label: Text(
                                nextEvo.name as String,
                              ),
                              onSelected: (b) {},
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
