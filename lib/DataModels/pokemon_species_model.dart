// To parse this JSON data, do
//
//     final pokemonSpecies = pokemonSpeciesFromJson(jsonString);

import 'dart:convert';

PokemonSpecies pokemonSpeciesFromJson(String str) =>
    PokemonSpecies.fromJson(json.decode(str));

// String pokemonSpeciesToJson(PokemonSpecies data) => json.encode(data.toJson());

class PokemonSpecies {
  PokemonSpecies({
    this.baseHappiness,
    this.captureRate,
    this.color,
    this.eggGroups,
    this.evolutionChain,
    this.evolvesFromSpecies,
    this.flavorTextEntries,
    this.formDescriptions,
    this.formsSwitchable,
    this.genderRate,
    required this.genera,
    this.generation,
    this.growthRate,
    this.habitat,
    required this.hasGenderDifferences,
    this.hatchCounter,
    this.id,
    this.isBaby,
    this.isLegendary,
    this.isMythical,
    this.name,
    this.names,
    this.order,
    this.palParkEncounters,
    this.pokedexNumbers,
    this.shape,
    this.varieties,
  });

  final int? baseHappiness;
  final int? captureRate;
  final Color? color;
  final List<Color>? eggGroups;
  final EvolutionChain? evolutionChain;
  final dynamic evolvesFromSpecies;
  final List<FlavorTextEntry>? flavorTextEntries;
  final List<dynamic>? formDescriptions;
  final bool? formsSwitchable;
  final int? genderRate;
  final List<Genus> genera;
  final Color? generation;
  final Color? growthRate;
  final Color? habitat;
  final bool hasGenderDifferences;
  final int? hatchCounter;
  final int? id;
  final bool? isBaby;
  final bool? isLegendary;
  final bool? isMythical;
  final String? name;
  final List<Name>? names;
  final int? order;
  final List<PalParkEncounter>? palParkEncounters;
  final List<PokedexNumber>? pokedexNumbers;
  final Color? shape;
  final List<Variety>? varieties;

  factory PokemonSpecies.fromJson(Map<String, dynamic> json) => PokemonSpecies(
        // baseHappiness: json["base_happiness"],
        // captureRate: json["capture_rate"],
        // color: Color.fromJson(json["color"]),
        // eggGroups: List<Color>.from(json["egg_groups"].map((x) => Color.fromJson(x))),
        // evolutionChain: EvolutionChain.fromJson(json["evolution_chain"]),
        // evolvesFromSpecies: json["evolves_from_species"],
        flavorTextEntries: List<FlavorTextEntry>.from(
            json["flavor_text_entries"]
                .map((x) => FlavorTextEntry.fromJson(x))),
        // formDescriptions: List<dynamic>.from(json["form_descriptions"].map((x) => x)),
        // formsSwitchable: json["forms_switchable"],
        // genderRate: json["gender_rate"],
        genera: List<Genus>.from(json["genera"].map((x) => Genus.fromJson(x))),
        // generation: Color.fromJson(json["generation"]),
        // growthRate: Color.fromJson(json["growth_rate"]),
        // habitat: Color.fromJson(json["habitat"]),
        hasGenderDifferences: json["has_gender_differences"],
        // hatchCounter: json["hatch_counter"],
        id: json["id"],
        // isBaby: json["is_baby"],
        // isLegendary: json["is_legendary"],
        // isMythical: json["is_mythical"],
        name: json["name"],
        // names: List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
        // order: json["order"],
        // palParkEncounters: List<PalParkEncounter>.from(json["pal_park_encounters"].map((x) => PalParkEncounter.fromJson(x))),
        // pokedexNumbers: List<PokedexNumber>.from(json["pokedex_numbers"].map((x) => PokedexNumber.fromJson(x))),
        // shape: Color.fromJson(json["shape"]),
        // varieties: List<Variety>.from(json["varieties"].map((x) => Variety.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //     "base_happiness": baseHappiness,
  //     "capture_rate": captureRate,
  //     "color": color.toJson(),
  //     "egg_groups": List<dynamic>.from(eggGroups.map((x) => x.toJson())),
  //     "evolution_chain": evolutionChain.toJson(),
  //     "evolves_from_species": evolvesFromSpecies,
  //     "flavor_text_entries": List<dynamic>.from(flavorTextEntries.map((x) => x.toJson())),
  //     "form_descriptions": List<dynamic>.from(formDescriptions.map((x) => x)),
  //     "forms_switchable": formsSwitchable,
  //     "gender_rate": genderRate,
  //     "genera": List<dynamic>.from(genera.map((x) => x.toJson())),
  //     "generation": generation.toJson(),
  //     "growth_rate": growthRate.toJson(),
  //     "habitat": habitat.toJson(),
  //     "has_gender_differences": hasGenderDifferences,
  //     "hatch_counter": hatchCounter,
  //     "id": id,
  //     "is_baby": isBaby,
  //     "is_legendary": isLegendary,
  //     "is_mythical": isMythical,
  //     "name": name,
  //     "names": List<dynamic>.from(names.map((x) => x.toJson())),
  //     "order": order,
  //     "pal_park_encounters": List<dynamic>.from(palParkEncounters.map((x) => x.toJson())),
  //     "pokedex_numbers": List<dynamic>.from(pokedexNumbers.map((x) => x.toJson())),
  //     "shape": shape.toJson(),
  //     "varieties": List<dynamic>.from(varieties.map((x) => x.toJson())),
  // };
}

class Color {
  Color({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class EvolutionChain {
  EvolutionChain({
    required this.url,
  });

  final String url;

  factory EvolutionChain.fromJson(Map<String, dynamic> json) => EvolutionChain(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class FlavorTextEntry {
  FlavorTextEntry({
    required this.flavorText,
    required this.language,
    required this.version,
  });

  final String flavorText;
  final Color language;
  final Color version;

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) =>
      FlavorTextEntry(
        flavorText: json["flavor_text"],
        language: Color.fromJson(json["language"]),
        version: Color.fromJson(json["version"]),
      );

  Map<String, dynamic> toJson() => {
        "flavor_text": flavorText,
        "language": language.toJson(),
        "version": version.toJson(),
      };
}

class Genus {
  Genus({
    required this.genus,
    required this.language,
  });

  final String genus;
  final Color language;

  factory Genus.fromJson(Map<String, dynamic> json) => Genus(
        genus: json["genus"],
        language: Color.fromJson(json["language"]),
      );

  Map<String, dynamic> toJson() => {
        "genus": genus,
        "language": language.toJson(),
      };
}

class Name {
  Name({
    required this.language,
    required this.name,
  });

  final Color language;
  final String name;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        language: Color.fromJson(json["language"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "language": language.toJson(),
        "name": name,
      };
}

class PalParkEncounter {
  PalParkEncounter({
    required this.area,
    required this.baseScore,
    required this.rate,
  });

  final Color area;
  final int baseScore;
  final int rate;

  factory PalParkEncounter.fromJson(Map<String, dynamic> json) =>
      PalParkEncounter(
        area: Color.fromJson(json["area"]),
        baseScore: json["base_score"],
        rate: json["rate"],
      );

  Map<String, dynamic> toJson() => {
        "area": area.toJson(),
        "base_score": baseScore,
        "rate": rate,
      };
}

class PokedexNumber {
  PokedexNumber({
    required this.entryNumber,
    required this.pokedex,
  });

  final int entryNumber;
  final Color pokedex;

  factory PokedexNumber.fromJson(Map<String, dynamic> json) => PokedexNumber(
        entryNumber: json["entry_number"],
        pokedex: Color.fromJson(json["pokedex"]),
      );

  Map<String, dynamic> toJson() => {
        "entry_number": entryNumber,
        "pokedex": pokedex.toJson(),
      };
}

class Variety {
  Variety({
    required this.isDefault,
    required this.pokemon,
  });

  final bool isDefault;
  final Color pokemon;

  factory Variety.fromJson(Map<String, dynamic> json) => Variety(
        isDefault: json["is_default"],
        pokemon: Color.fromJson(json["pokemon"]),
      );

  Map<String, dynamic> toJson() => {
        "is_default": isDefault,
        "pokemon": pokemon.toJson(),
      };
}
