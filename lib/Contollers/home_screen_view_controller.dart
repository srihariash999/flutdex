import 'package:flutdex/DataModels/pokemon_model.dart';
import 'package:flutdex/Network/poke_api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeScreenViewController =
    ChangeNotifierProvider((ref) => HomeScreenViewController(ref.read));

class HomeScreenViewController extends ChangeNotifier {
  final Reader read;
  HomeScreenViewController(this.read);

  List<Pokemon> _pokemons = [];
  List<Pokemon> get pokemons => _pokemons;

  bool _isLoadMoreLoading = false;
  bool get isLoadMoreLoading => _isLoadMoreLoading;

  late PokeApiRepository _pokeRepository;

  int _offset = 1;
  int _limit = 10;

  void initState() async {
    _pokeRepository = read(pokeApiRepository);
    await Future.delayed(Duration(seconds: 1));

    await _loadPokemonsFromApi();
  }

  loadMorePokemons() async {
    _offset += _limit;
    await _loadPokemonsFromApi();
    notifyListeners();
  }

  _loadPokemonsFromApi() async {
    _isLoadMoreLoading = true;
    notifyListeners();
    List<Pokemon> _pokemonBuffer = await _pokeRepository.getPokemonsList(
        offset: _offset, limit: _offset + _limit);
    _pokemons += _pokemonBuffer;

    _isLoadMoreLoading = false;
    notifyListeners();
  }
}
