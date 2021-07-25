import 'package:flutdex/DataModels/pokemon_model.dart';
import 'package:flutdex/DataModels/pokemon_species_model.dart';
import 'package:flutdex/Network/poke_api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pokemonDetailsViewController = StateNotifierProvider.autoDispose
    .family<PokemonDetailsViewNotifier, PokemonDetailsViewState, int>(
        (ref, id) {
  ref.onDispose(() {
    // print("disposed");
  });
  return PokemonDetailsViewNotifier(ref.read(pokeApiRepository), id);
});

class PokemonDetailsViewNotifier
    extends StateNotifier<PokemonDetailsViewState> {
  final PokeApiRepository pokeApiRepository;
  final int id;
  PokemonDetailsViewNotifier(this.pokeApiRepository, this.id)
      : super(PokemonDetailsViewState.initial()) {
    _loadPokemonSpeciesFromApi(id);
  }

  _loadPokemonSpeciesFromApi(int id) async {
    state = state.copyWith(isLoading: true);
    PokemonSpecies _pokemonSpecies =
        await pokeApiRepository.getPokemonSpecies(id: id);

    // print('${_pokemonSpecies.name}');
    state = state.copyWith(pokemonSpecies: _pokemonSpecies, isLoading: false);
    String eId = state.pokemonSpecies.evolutionChain.url;
    eId = eId.replaceAll("https://pokeapi.co/api/v2/evolution-chain/", '');
    eId = eId.replaceAll('/', '');
    pokeApiRepository
        .getPokemonEvolutionChain(id: int.parse(eId))
        .then((List<Pokemon> pokemonEvolChain) {
      state = state.copyWith(pokemonEvolutionChain: pokemonEvolChain);
    });
  }
}

class PokemonDetailsViewState {
  final PokemonSpecies pokemonSpecies;
  final List<Pokemon> pokemonEvolutionChain;
  final bool isLoading;
  PokemonDetailsViewState({
    required this.pokemonSpecies,
    required this.isLoading,
    required this.pokemonEvolutionChain,
  });
  factory PokemonDetailsViewState.initial() {
    return PokemonDetailsViewState(
      isLoading: true,
      pokemonSpecies: PokemonSpecies(
        hasGenderDifferences: false,
        evolutionChain: EvolutionChain(url: ''),
        genera: [
          Genus(
            genus: "",
            language: Color(name: '', url: ''),
          ),
        ],
      ),
      pokemonEvolutionChain: [],
    );
  }
  PokemonDetailsViewState copyWith(
      {PokemonSpecies? pokemonSpecies,
      bool? isLoading,
      List<Pokemon>? pokemonEvolutionChain}) {
    return PokemonDetailsViewState(
      pokemonSpecies: pokemonSpecies ?? this.pokemonSpecies,
      isLoading: isLoading ?? this.isLoading,
      pokemonEvolutionChain:
          pokemonEvolutionChain ?? this.pokemonEvolutionChain,
    );
  }
}
