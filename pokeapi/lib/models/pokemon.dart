import 'package:flutter/material.dart';

// To parse this JSON data, do
//
//     final pokemon = pokemonFromMap(jsonString);

import 'dart:convert';

Pokemon pokemonFromMap(String str) {
  var data = json.decode(str);
  return Pokemon.fromMap(data, "algún otro argumento");
}

String pokemonToMap(Pokemon data) => json.encode(data.toMap());

class Pokemon {
  List<Ability> abilities;
  int baseExperience;
  Cries cries;
  List<Species> forms;
  List<GameIndex> gameIndices;
  int height;
  List<dynamic> heldItems;
  int id;
  bool isDefault;
  String locationAreaEncounters;
  List<Move> moves;
  String name;
  int order;
  List<dynamic> pastAbilities;
  List<dynamic> pastTypes;
  Species species;
  Sprites sprites;
  List<Stat> stats;
  List<Type> types;
  int weight;
  String imageUrl;

  Pokemon({
    required this.abilities,
    required this.baseExperience,
    required this.cries,
    required this.forms,
    required this.gameIndices,
    required this.height,
    required this.heldItems,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.moves,
    required this.name,
    required this.order,
    required this.pastAbilities,
    required this.pastTypes,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
    required this.imageUrl,
  });

  factory Pokemon.fromMap(Map<String, dynamic> json, item) => Pokemon(
        imageUrl: json['sprites']['front_default'],
        abilities: List<Ability>.from(
            json["abilities"].map((x) => Ability.fromMap(x))),
        baseExperience: json["base_experience"],
        cries: Cries.fromMap(json["cries"]),
        forms: List<Species>.from(json["forms"].map((x) => Species.fromMap(x))),
        gameIndices: List<GameIndex>.from(
            json["game_indices"].map((x) => GameIndex.fromMap(x))),
        height: json["height"],
        heldItems: List<dynamic>.from(json["held_items"].map((x) => x)),
        id: json["id"],
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        moves: List<Move>.from(json["moves"].map((x) => Move.fromMap(x))),
        name: json["name"],
        order: json["order"],
        pastAbilities: List<dynamic>.from(json["past_abilities"].map((x) => x)),
        pastTypes: List<dynamic>.from(json["past_types"].map((x) => x)),
        species: Species.fromMap(json["species"]),
        sprites: Sprites.fromMap(json["sprites"]),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromMap(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromMap(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toMap() => {
        "abilities": List<dynamic>.from(abilities.map((x) => x.toMap())),
        "base_experience": baseExperience,
        "cries": cries.toMap(),
        "forms": List<dynamic>.from(forms.map((x) => x.toMap())),
        "game_indices": List<dynamic>.from(gameIndices.map((x) => x.toMap())),
        "height": height,
        "held_items": List<dynamic>.from(heldItems.map((x) => x)),
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "moves": List<dynamic>.from(moves.map((x) => x.toMap())),
        "name": name,
        "order": order,
        "past_abilities": List<dynamic>.from(pastAbilities.map((x) => x)),
        "past_types": List<dynamic>.from(pastTypes.map((x) => x)),
        "species": species.toMap(),
        "sprites": sprites.toMap(),
        "stats": List<dynamic>.from(stats.map((x) => x.toMap())),
        "types": List<dynamic>.from(types.map((x) => x.toMap())),
        "weight": weight,
      };

  Color getColorForType(String type) {
    switch (type) {
      case 'grass':
        return Colors.green;
      case 'fire':
        return Colors.red;
      case 'water':
        return Colors.blue;
      case 'bug':
        return const Color.fromARGB(255, 4, 255, 12);
      case 'normal':
        return Colors.grey;
      case 'poison':
        return Colors.purple;
      case 'electric':
        return Colors.yellow;
      case 'ground':
        return const Color.fromARGB(255, 82, 82, 13);
      case 'fairy':
        return const Color.fromARGB(255, 248, 146, 248);
      case 'fighting':
        return const Color.fromARGB(255, 187, 77, 77);
      case 'psychic':
        return const Color.fromARGB(255, 173, 132, 173);
      case 'rock':
        return const Color.fromARGB(255, 63, 44, 4);
      case 'ghost':
        return const Color.fromARGB(255, 82, 82, 82);
      case 'ice':
        return const Color.fromARGB(255, 173, 248, 248);
      case 'dragon':
        return const Color.fromARGB(255, 0, 0, 255);
      case 'dark':
        return const Color.fromARGB(255, 31, 28, 28);
      case 'steel':
        return const Color.fromARGB(255, 173, 173, 173);
      case 'flying':
        return const Color.fromARGB(255, 173, 173, 255);        
      default:
        return Colors.grey;
    }
  }
}

class Ability {
  Species ability;
  bool isHidden;
  int slot;

  Ability({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory Ability.fromMap(Map<String, dynamic> json) => Ability(
        ability: Species.fromMap(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );

  Map<String, dynamic> toMap() => {
        "ability": ability.toMap(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}

class Species {
  String name;
  String url;

  Species({
    required this.name,
    required this.url,
  });

  factory Species.fromMap(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}

class Cries {
  String latest;
  String legacy;

  Cries({
    required this.latest,
    required this.legacy,
  });

  factory Cries.fromMap(Map<String, dynamic> json) => Cries(
        latest: json["latest"],
        legacy: json["legacy"],
      );

  Map<String, dynamic> toMap() => {
        "latest": latest,
        "legacy": legacy,
      };
}

class GameIndex {
  int gameIndex;
  Species version;

  GameIndex({
    required this.gameIndex,
    required this.version,
  });

  factory GameIndex.fromMap(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        version: Species.fromMap(json["version"]),
      );

  Map<String, dynamic> toMap() => {
        "game_index": gameIndex,
        "version": version.toMap(),
      };
}

class Move {
  Species move;
  List<VersionGroupDetail> versionGroupDetails;

  Move({
    required this.move,
    required this.versionGroupDetails,
  });

  factory Move.fromMap(Map<String, dynamic> json) => Move(
        move: Species.fromMap(json["move"]),
        versionGroupDetails: List<VersionGroupDetail>.from(
            json["version_group_details"]
                .map((x) => VersionGroupDetail.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "move": move.toMap(),
        "version_group_details":
            List<dynamic>.from(versionGroupDetails.map((x) => x.toMap())),
      };
}

class VersionGroupDetail {
  int levelLearnedAt;
  Species moveLearnMethod;
  Species versionGroup;

  VersionGroupDetail({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });

  factory VersionGroupDetail.fromMap(Map<String, dynamic> json) =>
      VersionGroupDetail(
        levelLearnedAt: json["level_learned_at"],
        moveLearnMethod: Species.fromMap(json["move_learn_method"]),
        versionGroup: Species.fromMap(json["version_group"]),
      );

  Map<String, dynamic> toMap() => {
        "level_learned_at": levelLearnedAt,
        "move_learn_method": moveLearnMethod.toMap(),
        "version_group": versionGroup.toMap(),
      };
}

class GenerationV {
  Sprites blackWhite;

  GenerationV({
    required this.blackWhite,
  });

  factory GenerationV.fromMap(Map<String, dynamic> json) => GenerationV(
        blackWhite: Sprites.fromMap(json["black-white"]),
      );

  Map<String, dynamic> toMap() => {
        "black-white": blackWhite.toMap(),
      };
}

class GenerationIv {
  Sprites diamondPearl;
  Sprites heartgoldSoulsilver;
  Sprites platinum;

  GenerationIv({
    required this.diamondPearl,
    required this.heartgoldSoulsilver,
    required this.platinum,
  });

  factory GenerationIv.fromMap(Map<String, dynamic> json) => GenerationIv(
        diamondPearl: Sprites.fromMap(json["diamond-pearl"]),
        heartgoldSoulsilver: Sprites.fromMap(json["heartgold-soulsilver"]),
        platinum: Sprites.fromMap(json["platinum"]),
      );

  Map<String, dynamic> toMap() => {
        "diamond-pearl": diamondPearl.toMap(),
        "heartgold-soulsilver": heartgoldSoulsilver.toMap(),
        "platinum": platinum.toMap(),
      };
}

class Versions {
  GenerationI generationI;
  GenerationIi generationIi;
  GenerationIii generationIii;
  GenerationIv generationIv;
  GenerationV generationV;
  Map<String, Home> generationVi;
  GenerationVii generationVii;
  GenerationViii generationViii;

  Versions({
    required this.generationI,
    required this.generationIi,
    required this.generationIii,
    required this.generationIv,
    required this.generationV,
    required this.generationVi,
    required this.generationVii,
    required this.generationViii,
  });

  factory Versions.fromMap(Map<String, dynamic> json) => Versions(
        generationI: GenerationI.fromMap(json["generation-i"]),
        generationIi: GenerationIi.fromMap(json["generation-ii"]),
        generationIii: GenerationIii.fromMap(json["generation-iii"]),
        generationIv: GenerationIv.fromMap(json["generation-iv"]),
        generationV: GenerationV.fromMap(json["generation-v"]),
        generationVi: Map.from(json["generation-vi"])
            .map((k, v) => MapEntry<String, Home>(k, Home.fromMap(v))),
        generationVii: GenerationVii.fromMap(json["generation-vii"]),
        generationViii: GenerationViii.fromMap(json["generation-viii"]),
      );

  Map<String, dynamic> toMap() => {
        "generation-i": generationI.toMap(),
        "generation-ii": generationIi.toMap(),
        "generation-iii": generationIii.toMap(),
        "generation-iv": generationIv.toMap(),
        "generation-v": generationV.toMap(),
        "generation-vi": Map.from(generationVi)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "generation-vii": generationVii.toMap(),
        "generation-viii": generationViii.toMap(),
      };
}

class Other {
  DreamWorld dreamWorld;
  Home home;
  OfficialArtwork officialArtwork;
  Sprites showdown;

  Other({
    required this.dreamWorld,
    required this.home,
    required this.officialArtwork,
    required this.showdown,
  });

  factory Other.fromMap(Map<String, dynamic> json) => Other(
        dreamWorld: DreamWorld.fromMap(json["dream_world"]),
        home: Home.fromMap(json["home"]),
        officialArtwork: OfficialArtwork.fromMap(json["official-artwork"]),
        showdown: Sprites.fromMap(json["showdown"]),
      );

  Map<String, dynamic> toMap() => {
        "dream_world": dreamWorld.toMap(),
        "home": home.toMap(),
        "official-artwork": officialArtwork.toMap(),
        "showdown": showdown.toMap(),
      };
}

class Sprites {
  String backDefault;
  dynamic backFemale;
  String backShiny;
  dynamic backShinyFemale;
  String frontDefault;
  dynamic frontFemale;
  String frontShiny;
  dynamic frontShinyFemale;
  Other? other;
  Versions? versions;
  Sprites? animated;

  Sprites({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
    this.other,
    this.versions,
    this.animated,
  });

  factory Sprites.fromMap(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
        other: json["other"] == null ? null : Other.fromMap(json["other"]),
        versions: json["versions"] == null
            ? null
            : Versions.fromMap(json["versions"]),
        animated:
            json["animated"] == null ? null : Sprites.fromMap(json["animated"]),
      );

  Map<String, dynamic> toMap() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
        "other": other?.toMap(),
        "versions": versions?.toMap(),
        "animated": animated?.toMap(),
      };
}

class GenerationI {
  RedBlue redBlue;
  RedBlue yellow;

  GenerationI({
    required this.redBlue,
    required this.yellow,
  });

  factory GenerationI.fromMap(Map<String, dynamic> json) => GenerationI(
        redBlue: RedBlue.fromMap(json["red-blue"]),
        yellow: RedBlue.fromMap(json["yellow"]),
      );

  Map<String, dynamic> toMap() => {
        "red-blue": redBlue.toMap(),
        "yellow": yellow.toMap(),
      };
}

class RedBlue {
  dynamic backDefault;
  dynamic backGray;
  dynamic backTransparent;
  dynamic frontDefault;
  dynamic frontGray;
  dynamic frontTransparent;

  RedBlue({
    required this.backDefault,
    required this.backGray,
    required this.backTransparent,
    required this.frontDefault,
    required this.frontGray,
    required this.frontTransparent,
  });

  factory RedBlue.fromMap(Map<String, dynamic> json) => RedBlue(
        backDefault: json["back_default"],
        backGray: json["back_gray"],
        backTransparent: json["back_transparent"],
        frontDefault: json["front_default"],
        frontGray: json["front_gray"],
        frontTransparent: json["front_transparent"],
      );

  Map<String, dynamic> toMap() => {
        "back_default": backDefault,
        "back_gray": backGray,
        "back_transparent": backTransparent,
        "front_default": frontDefault,
        "front_gray": frontGray,
        "front_transparent": frontTransparent,
      };
}

class GenerationIi {
  Crystal crystal;
  Gold gold;
  Gold silver;

  GenerationIi({
    required this.crystal,
    required this.gold,
    required this.silver,
  });

  factory GenerationIi.fromMap(Map<String, dynamic> json) => GenerationIi(
        crystal: Crystal.fromMap(json["crystal"]),
        gold: Gold.fromMap(json["gold"]),
        silver: Gold.fromMap(json["silver"]),
      );

  Map<String, dynamic> toMap() => {
        "crystal": crystal.toMap(),
        "gold": gold.toMap(),
        "silver": silver.toMap(),
      };
}

class Crystal {
  String backDefault;
  String backShiny;
  String backShinyTransparent;
  String backTransparent;
  String frontDefault;
  String frontShiny;
  String frontShinyTransparent;
  String frontTransparent;

  Crystal({
    required this.backDefault,
    required this.backShiny,
    required this.backShinyTransparent,
    required this.backTransparent,
    required this.frontDefault,
    required this.frontShiny,
    required this.frontShinyTransparent,
    required this.frontTransparent,
  });

  factory Crystal.fromMap(Map<String, dynamic> json) => Crystal(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        backShinyTransparent: json["back_shiny_transparent"],
        backTransparent: json["back_transparent"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        frontShinyTransparent: json["front_shiny_transparent"],
        frontTransparent: json["front_transparent"],
      );

  Map<String, dynamic> toMap() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "back_shiny_transparent": backShinyTransparent,
        "back_transparent": backTransparent,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "front_shiny_transparent": frontShinyTransparent,
        "front_transparent": frontTransparent,
      };
}

class Gold {
  String? backDefault;
  String? backShiny;
  String? frontDefault;
  String? frontShiny;
  String? frontTransparent;

  Gold({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
    this.frontTransparent,
  });

  factory Gold.fromMap(Map<String, dynamic> json) => Gold(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        frontTransparent: json["front_transparent"],
      );

  Map<String, dynamic> toMap() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "front_transparent": frontTransparent,
      };
}

class GenerationIii {
  OfficialArtwork emerald;
  Gold fireredLeafgreen;
  Gold rubySapphire;

  GenerationIii({
    required this.emerald,
    required this.fireredLeafgreen,
    required this.rubySapphire,
  });

  factory GenerationIii.fromMap(Map<String, dynamic> json) => GenerationIii(
        emerald: OfficialArtwork.fromMap(json["emerald"]),
        fireredLeafgreen: Gold.fromMap(json["firered-leafgreen"]),
        rubySapphire: Gold.fromMap(json["ruby-sapphire"]),
      );

  Map<String, dynamic> toMap() => {
        "emerald": emerald.toMap(),
        "firered-leafgreen": fireredLeafgreen.toMap(),
        "ruby-sapphire": rubySapphire.toMap(),
      };
}

class OfficialArtwork {
  String frontDefault;
  String frontShiny;

  OfficialArtwork({
    required this.frontDefault,
    required this.frontShiny,
  });

  factory OfficialArtwork.fromMap(Map<String, dynamic> json) => OfficialArtwork(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );

  Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };
}

class Home {
  String frontDefault;
  dynamic frontFemale;
  String frontShiny;
  dynamic frontShinyFemale;

  Home({
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });

  factory Home.fromMap(Map<String, dynamic> json) => Home(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );

  Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
      };
}

class GenerationVii {
  DreamWorld icons;
  Home ultraSunUltraMoon;

  GenerationVii({
    required this.icons,
    required this.ultraSunUltraMoon,
  });

  factory GenerationVii.fromMap(Map<String, dynamic> json) => GenerationVii(
        icons: DreamWorld.fromMap(json["icons"]),
        ultraSunUltraMoon: Home.fromMap(json["ultra-sun-ultra-moon"]),
      );

  Map<String, dynamic> toMap() => {
        "icons": icons.toMap(),
        "ultra-sun-ultra-moon": ultraSunUltraMoon.toMap(),
      };
}

class DreamWorld {
  String frontDefault;
  dynamic frontFemale;

  DreamWorld({
    required this.frontDefault,
    required this.frontFemale,
  });

  factory DreamWorld.fromMap(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
      );

  Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
      };
}

class GenerationViii {
  DreamWorld icons;

  GenerationViii({
    required this.icons,
  });

  factory GenerationViii.fromMap(Map<String, dynamic> json) => GenerationViii(
        icons: DreamWorld.fromMap(json["icons"]),
      );

  Map<String, dynamic> toMap() => {
        "icons": icons.toMap(),
      };
}

class Stat {
  int baseStat;
  int effort;
  Species stat;

  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory Stat.fromMap(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Species.fromMap(json["stat"]),
      );

  Map<String, dynamic> toMap() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat.toMap(),
      };
}

class Type {
  int slot;
  Species type;

  Type({
    required this.slot,
    required this.type,
  });

  factory Type.fromMap(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: Species.fromMap(json["type"]),
      );

  Map<String, dynamic> toMap() => {
        "slot": slot,
        "type": type.toMap(),
      };
}
