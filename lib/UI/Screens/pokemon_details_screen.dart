import 'package:flutdex/Contollers/pokemon_details_view_controller.dart';
import 'package:flutdex/DataModels/pokemon_model.dart';
import 'package:flutdex/UI/Widgets/type_chips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokemonDetailsScreen extends StatefulWidget {
  final Pokemon pokemon;

  PokemonDetailsScreen({required this.pokemon});

  @override
  _PokemonDetailsScreenState createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer(builder: (context, ref, child) {
      var _viewController =
          ref.watch(pokemonDetailsViewController(widget.pokemon.id));
      return Container(
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
                      '${widget.pokemon.name}'.replaceFirst(
                        '${widget.pokemon.name}'.substring(0, 1),
                        '${widget.pokemon.name}'.substring(0, 1).toUpperCase(),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '#${widget.pokemon.id.toString().padLeft(3, '0')}',
                      style: TextStyle(
                        color: Color(0xFF919191),
                        fontSize: 28.0,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.45,
                  width: MediaQuery.of(context).size.width * 0.35,
                  margin:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F2F2),
                  ),
                  child: Hero(
                    tag: 'pokemon_image${widget.pokemon.id}',
                    child: Image.network(
                      widget.pokemon.sprites!.other != null
                          ? widget.pokemon.sprites!.other!.officialArtwork
                              .frontDefault
                          : "http://pokeapi.co/media/sprites/pokemon/back/female/12.png",
                      fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.width * 0.28,
                      width: MediaQuery.of(context).size.width * 0.28,
                    ),
                  ),
                ),
                _viewController.isLoading
                    ? Container()
                    : Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 75.0, vertical: 12.0),
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  _viewController.pokemonSpecies
                                          .flavorTextEntries?[5].flavorText
                                          .replaceAll('\n', ' ') ??
                                      "",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            DetailsCard(
                              pokemon: widget.pokemon,
                              viewController: _viewController,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 75.0, vertical: 12.0),
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Type",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Row(
                                    children:
                                        widget.pokemon.types!.map((Type _type) {
                                      return TypeChip(
                                        type: _type.type.name,
                                        fontsize: 18.0,
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
              ],
            ),
          ],
        ),
      );
    }));
  }
}

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    Key? key,
    required PokemonDetailsViewState viewController,
    required this.pokemon,
  })  : _viewController = viewController,
        super(key: key);

  final Pokemon pokemon;
  final PokemonDetailsViewState _viewController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 75.0, vertical: 12.0),
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
        color: Color(0xff30A7D7),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CharecteristicWidget(
                charecteristic: 'Height',
                detail: (pokemon.height / 3.048).toStringAsFixed(2),
              ),
              CharecteristicWidget(
                charecteristic: 'Weight',
                detail: pokemon.weight.toString(),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'Gender',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                children: [Icon(Icons.male), Icon(Icons.female)],
              ),
              SizedBox(
                height: 8.0,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CharecteristicWidget(
                charecteristic: 'Category',
                detail: _viewController.pokemonSpecies.genera[7].genus
                    .replaceAll(' Pokémon', ''),
              ),
              DualCharecteristicWidget(
                charecteristic: 'Abilities',
                ability: pokemon.abilities[0].ability.name,
                ability2: pokemon.abilities.length >= 2
                    ? pokemon.abilities[1].ability.name
                    : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CharecteristicWidget extends StatelessWidget {
  final String charecteristic;
  final String detail;
  const CharecteristicWidget({
    Key? key,
    required this.charecteristic,
    required this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 8.0,
        ),
        Text(
          '$charecteristic',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          '$detail',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 18.0,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
      ],
    );
  }
}

class DualCharecteristicWidget extends StatelessWidget {
  final String charecteristic;
  final String ability;
  final String? ability2;
  const DualCharecteristicWidget({
    Key? key,
    required this.charecteristic,
    required this.ability,
    this.ability2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 8.0,
        ),
        Text(
          '$charecteristic',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          '$ability',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 18.0,
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        ability2 == null
            ? Container()
            : Text(
                '$ability2',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 18.0,
                ),
              ),
        SizedBox(
          height: 4.0,
        ),
      ],
    );
  }
}
