class PokeModel {
  late List<Pokemon> pokemon;

  PokeModel({required this.pokemon});

  PokeModel.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      pokemon = <Pokemon>[];
      json['pokemon'].forEach((value) {
        pokemon.add(Pokemon.fromJson(value));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pokemon'] = pokemon.map((map) => map.toJson()).toList();
    return data;
  }
}

class Pokemon {
  late int id;
  late String num;
  late String name;
  late String img;
  late List<String> type;
  late String height;
  late String weight;
  late List<String> weaknesses;
  late List<NextEvolution>? nextEvolution;

  Pokemon(
      {required this.id,
      required this.num,
      required this.name,
      required this.img,
      required this.type,
      required this.height,
      required this.weight,
      required this.weaknesses,
      this.nextEvolution});

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    num = json['num'];
    name = json['name'];
    img = json['img'];
    type = json['type'].cast<String>();
    height = json['height'];
    weight = json['weight'];

    weaknesses = json['weaknesses'].cast<String>();
    if (json['next_evolution'] != null) {
      nextEvolution = <NextEvolution>[];
      json['next_evolution'].forEach((value) {
        nextEvolution?.add(NextEvolution.fromJson(value));
      });
    } else {
      nextEvolution = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['num'] = num;
    data['name'] = name;
    data['img'] = img;
    data['type'] = type;
    data['height'] = height;
    data['weight'] = weight;
    data['weaknesses'] = weaknesses;
    data['next_evolution'] = nextEvolution?.map((value) => value.toJson()).toList();
    return data;
  }
}

class NextEvolution {
  String? num;
  String? name;

  NextEvolution({this.num, this.name});

  NextEvolution.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['num'] = num;
    data['name'] = name;
    return data;
  }
}
