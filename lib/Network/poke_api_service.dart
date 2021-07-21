import 'package:dio/dio.dart';
import 'package:flutdex/Constants/urls.dart';
import 'package:flutdex/DataModels/pokemon_model.dart';
import 'package:flutdex/DataModels/pokemon_species_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pokeApiRepository = Provider.autoDispose<PokeApiRepository>(
    (ref) => PokeApiRepositoryImpl(ref.read));

abstract class PokeApiRepository {
  Future<List<Pokemon>> getPokemonsList(
      {required int offset, required int limit});
  Future<PokemonSpecies> getPokemonSpecies({required int id});
}

class PokeApiRepositoryImpl implements PokeApiRepository {
  final Reader read;
  PokeApiRepositoryImpl(this.read);

  Dio _dio = Dio();

  Future<List<Pokemon>> getPokemonsList(
      {required int offset, required int limit}) async {
    List<Pokemon> _pokemons = [];

    for (int i = offset; i < limit; i++) {
      try {
        Response response = await _dio.get(getPokemonsUrl + '/$i');
        _pokemons.add(Pokemon.fromJson(response.data));
      } catch (e) {
        print(' error while getting : ${getPokemonsUrl + '/$i'} : $e');
      }
    }

    return _pokemons;
  }

  Future<PokemonSpecies> getPokemonSpecies({required int id}) async {
    PokemonSpecies _pokemonSpecies;
    try {
      Response response = await _dio.get(getPokemonsSpeciesUrl + '/$id');
      _pokemonSpecies = PokemonSpecies.fromJson(response.data);
    } catch (e) {
      _pokemonSpecies = PokemonSpecies(
          baseHappiness: 0,
          captureRate: 0,
          color: Color.fromJson({}),
          eggGroups: [Color.fromJson({})],
          evolutionChain: EvolutionChain(url: ''),
          evolvesFromSpecies: '',
          flavorTextEntries: [
            FlavorTextEntry(
                flavorText: '',
                language: Color.fromJson({}),
                version: Color.fromJson({}))
          ],
          formDescriptions: [],
          formsSwitchable: false,
          genderRate: 0,
          genera: [Genus.fromJson({})],
          generation: Color.fromJson({}),
          growthRate: Color.fromJson({}),
          habitat: Color.fromJson({}),
          hasGenderDifferences: false,
          hatchCounter: 0,
          id: id,
          isBaby: false,
          isLegendary: false,
          isMythical: false,
          name: '',
          names: [Name.fromJson({})],
          order: 0,
          palParkEncounters: [],
          pokedexNumbers: [],
          shape: Color.fromJson({}),
          varieties: []);
      print(' error while getting : ${getPokemonsUrl + '/$id'} : $e');
    }

    return _pokemonSpecies;
  }
}
