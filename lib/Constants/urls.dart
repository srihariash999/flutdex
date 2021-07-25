/*
Pokemon (endpoint)
Pokémon are the creatures that inhabit the world of the Pokémon games.
They can be caught using Pokéballs and trained by battling with other Pokémon.
Each Pokémon belongs to a specific species but may take on a variant which makes it differ from other Pokémon of the same species, such as base stats, available abilities and typings.
See Bulbapedia for greater detail.

GET https://pokeapi.co/api/v2/pokemon/{id or name}/

*/

const String getPokemonsUrl = "https://pokeapi.co/api/v2/pokemon/";

// ------------------------------------------------------------------------------------------------------------------------------

/*
Pokemon Species (endpoint)
A Pokémon Species forms the basis for at least one Pokémon. Attributes of a Pokémon species are shared across all varieties of Pokémon within the species. A good example is Wormadam; Wormadam is the species which can be found in three different varieties, Wormadam-Trash, Wormadam-Sandy and Wormadam-Plant.

GET https://pokeapi.co/api/v2/pokemon-species/{id or name}/
*/

const String getPokemonsSpeciesUrl =
    "https://pokeapi.co/api/v2/pokemon-species/";

// ------------------------------------------------------------------------------------------------------------------------------

/*
Evolution Chains (endpoint)
Evolution chains are essentially family trees. They start with the lowest stage within a family and detail evolution conditions for each as well as Pokémon they can evolve into up through the hierarchy.

GET https://pokeapi.co/api/v2/evolution-chain/{id}/
*/

const String getPokemonEvolutionChainUrl =
    "https://pokeapi.co/api/v2/evolution-chain/";
