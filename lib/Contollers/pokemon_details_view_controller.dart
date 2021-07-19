import 'package:flutdex/DataModels/pokemon_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pokemonDetailsViewController = ChangeNotifierProvider(
    (ref) => PokemonDetailsScreenViewController(ref.read));

class PokemonDetailsScreenViewController extends ChangeNotifier {
  final Reader read;
  PokemonDetailsScreenViewController(this.read);

  late Pokemon _pokemon;
  Pokemon get pokemon => _pokemon;
  void initState(Pokemon pokemon) async {
    _pokemon = pokemon;
    notifyListeners();
  }
}
