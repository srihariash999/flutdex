import 'package:flutdex/Contollers/home_screen_view_controller.dart';
import 'package:flutdex/DataModels/pokemon_model.dart';
import 'package:flutdex/UI/Screens/pokemon_details_screen.dart';
import 'package:flutdex/UI/Widgets/type_chips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ScrollController _scrollController = ScrollController();

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _gridTileWidth = 200.0;
    final double _gridTileHeight = 200.0;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pokedex'),
        ),
        body: Consumer(builder: (context, ref, child) {
          var _viewController = ref.watch(homeScreenViewController);

          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                    controller: _scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          MediaQuery.of(context).size.width ~/ _gridTileWidth,
                      mainAxisExtent: _gridTileHeight,
                    ),
                    itemCount: _viewController.pokemons.length,
                    itemBuilder: (context, index) {
                      Pokemon _pokemon = _viewController.pokemons[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PokemonDetailsScreen(pokemon: _pokemon),
                            ),
                          );
                        },
                        child: Container(
                          height: _gridTileHeight,
                          width: _gridTileWidth,
                          margin: EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 6.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF2F2F2),
                                  ),
                                  height: 100.0,
                                  width: 130.0,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Hero(
                                      tag: 'pokemon_image${_pokemon.id}',
                                      child: Image.network(
                                        _pokemon.sprites!.other != null
                                            ? _pokemon.sprites!.other!
                                                .officialArtwork.frontDefault
                                            : "http://pokeapi.co/media/sprites/pokemon/back/female/12.png",
                                        fit: BoxFit.cover,
                                        height: 120.0,
                                        width: 120.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 40.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '#${_pokemon.id.toString().padLeft(3, '0')}',
                                  style: TextStyle(
                                    color: Color(0xFF919191),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 40.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${_pokemon.name.toString().replaceFirst(_pokemon.name.toString()[0], _pokemon.name.toString()[0].toUpperCase())}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Container(
                                width: 150.0,
                                padding: EdgeInsets.only(left: 38.0),
                                child: Row(
                                  children: _pokemon.types!.map((Type _type) {
                                    return TypeChip(type: _type.type.name);
                                  }).toList(),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (!_viewController.isLoadMoreLoading) {
                        await ref
                            .read(homeScreenViewController.notifier)
                            .loadMorePokemons();
                        WidgetsBinding.instance!.addPostFrameCallback((_) {
                          _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent,
                              duration: Duration(milliseconds: 100),
                              curve: Curves.easeInOut);
                        });
                      }
                    },
                    child: _viewController.isLoadMoreLoading
                        ? Container(
                            width: 50.0,
                            height: 1.0,
                            child: LinearProgressIndicator(
                              color: Colors.black,
                              minHeight: 1.0,
                            ),
                          )
                        : Text('Load More Pokemon'),
                  ),
                ],
              )
            ],
          );
        }));
  }
}
