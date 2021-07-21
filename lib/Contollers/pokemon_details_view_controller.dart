import 'package:flutdex/DataModels/pokemon_species_model.dart';
import 'package:flutdex/Network/poke_api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pokemonDetailsViewController = StateNotifierProvider.autoDispose
    .family<PokemonDetailsViewNotifier, PokemonDetailsViewState, int>(
        (ref, id) {
  ref.onDispose(() {
    print("disposed");
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
    print('${_pokemonSpecies.name}');
    state = state.copyWith(pokemonSpecies: _pokemonSpecies, isLoading: false);
  }
}

class PokemonDetailsViewState {
  final PokemonSpecies pokemonSpecies;
  final bool isLoading;
  PokemonDetailsViewState(
      {required this.pokemonSpecies, required this.isLoading});
  factory PokemonDetailsViewState.initial() {
    return PokemonDetailsViewState(
      isLoading: true,
      pokemonSpecies: PokemonSpecies(
        hasGenderDifferences: false,
        genera: [
          Genus(
            genus: "",
            language: Color(name: '', url: ''),
          ),
        ],
      ),
    );
  }
  PokemonDetailsViewState copyWith(
      {PokemonSpecies? pokemonSpecies, bool? isLoading}) {
    return PokemonDetailsViewState(
      pokemonSpecies: pokemonSpecies ?? this.pokemonSpecies,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
