import 'package:dio/dio.dart';
import 'package:flutdex/Constants/urls.dart';
import 'package:flutdex/DataModels/pokemon_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pokeApiRepository = Provider.autoDispose<PokeApiRepository>(
    (ref) => PokeApiRepositoryImpl(ref.read));

abstract class PokeApiRepository {
  Future<List<Pokemon>> getPokemonsList(
      {required int offset, required int limit});
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
}
