import 'package:flutdex/DataModels/pokemon_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PokemonDetailsScreen extends HookWidget {
  final Pokemon pokemon;
  PokemonDetailsScreen({Key? key, required this.pokemon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
              ),
              Row(
                children: [
                  Text(
                    '${pokemon.name}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '#${pokemon.id.toString().padLeft(3, '0')}',
                    style: TextStyle(
                      color: Color(0xFF919191),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              )
            ],
          ),
          Row(
            children: [
              Hero(
                tag: 'pokemon_image${pokemon.id}',
                child: Image.network(
                  pokemon.sprites!.other != null
                      ? pokemon.sprites!.other!.officialArtwork.frontDefault
                      : "http://pokeapi.co/media/sprites/pokemon/back/female/12.png",
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.width * 0.25,
                  width: MediaQuery.of(context).size.width * 0.25,
                ),
              ),
              Column(
                children: [
                  Text(
                    '${pokemon.name }',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      )),
    );
  }
}
