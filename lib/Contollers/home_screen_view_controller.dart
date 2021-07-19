import 'package:flutdex/DataModels/pokemon_model.dart';
import 'package:flutdex/Network/poke_api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeScreenViewController =
    StateNotifierProvider<HomeScreenViewNotifier, HomeScreenViewState>((ref) {
  return HomeScreenViewNotifier(ref.read(pokeApiRepository));
});

class HomeScreenViewNotifier extends StateNotifier<HomeScreenViewState> {
  final PokeApiRepository pokeApiRepository;
  HomeScreenViewNotifier(this.pokeApiRepository)
      : super(HomeScreenViewState(isLoadMoreLoading: false, pokemons: [])) {
    _loadPokemonsFromApi();
  }

  int _offset = 1;
  int _limit = 10;

  loadMorePokemons() async {
    _offset += _limit;
    await _loadPokemonsFromApi();
  }

  _loadPokemonsFromApi() async {
    
    state = state.copyWith(pokemons: state.pokemons, isLoadMoreLoading: true);
   
    List<Pokemon> _pokemonBuffer = await pokeApiRepository.getPokemonsList(
        offset: _offset, limit: _offset + _limit);
    
    state = state.copyWith(
        pokemons: state.pokemons + _pokemonBuffer, isLoadMoreLoading: false);
    
  }
}

// class HomeScreenViewController {
//   // final PokeApiRepository _pokeApiRepository;
//   HomeScreenViewController() {
//     // initState();
//   }

//   // List<Pokemon> _pokemons = [];
//   // List<Pokemon> get pokemons => _pokemons;

//   // bool _isLoadMoreLoading = false;
//   // bool get isLoadMoreLoading => _isLoadMoreLoading;

//   // int _offset = 1;
//   // int _limit = 10;

//   // void initState() async {
//   //   _pokemons = [];
//   //   await _loadPokemonsFromApi();
//   // }

//   // loadMorePokemons() async {
//   //   _offset += _limit;
//   //   await _loadPokemonsFromApi();
//   // }

//   // _loadPokemonsFromApi() async {
//   //   _isLoadMoreLoading = true;

//   //   List<Pokemon> _pokemonBuffer = await _pokeApiRepository.getPokemonsList(
//   //       offset: _offset, limit: _offset + _limit);
//   //   _pokemons += _pokemonBuffer;

//   //   _isLoadMoreLoading = false;
//   // }
// }

class HomeScreenViewState {
  final List<Pokemon> pokemons;

  final bool isLoadMoreLoading;

  HomeScreenViewState(
      {required this.pokemons, required this.isLoadMoreLoading});

  HomeScreenViewState copyWith({
    required bool isLoadMoreLoading,
    required List<Pokemon> pokemons,
  }) {
    return HomeScreenViewState(
        pokemons: pokemons, isLoadMoreLoading: isLoadMoreLoading);
  }
}
