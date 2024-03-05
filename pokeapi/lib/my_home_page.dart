import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokeapi/const/pokemon_services.dart';
import 'package:pokeapi/models/pokemon.dart';

import 'widgets/pokemon_detail_drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Pokemon> pokemonList = [];
  Pokemon? selectedPokemon;

  @override
  void initState() {
    super.initState();
    fetchPokemonList();
  }

  Future<void> fetchPokemonList() async {
    final pokemonService = PokemonService();
    pokemonList = await pokemonService.fetchPokemonList();
    if (pokemonList.isNotEmpty) {
      setState(() {
        selectedPokemon = pokemonList[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 98, 45),
      endDrawer: selectedPokemon != null
          ? PokemonDetailDrawer(selectedPokemon!)
          : null,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/pokeball.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: selectedPokemon != null
                    ? pokemonDetail(selectedPokemon!)
                    : const Center(child: CircularProgressIndicator()),
              ),
              Expanded(
                flex: 2, // Aumentar el ancho de la lista de Pokemon
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      color: Colors.white,
                      width: 4,
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: pokemonList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: selectedPokemon == pokemonList[index]
                              ? BoxDecoration(
                                  border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 23, 83, 25),
                                    width: 2, // Ancho del borde
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                )
                              : null,
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                selectedPokemon = pokemonList[index];
                              });
                            },
                            leading: const CircleAvatar(
                              radius: 9,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.orange,
                              ),
                            ),
                            title: Text(
                              pokemonList[index].name.toUpperCase(),
                              style: GoogleFonts.pixelifySans(
                                // Cambiar la fuente
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget pokemonDetail(Pokemon pokemon) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: SizedBox(
              child: Image.network(
                pokemon.imageUrl,
                width: 200,
                height: 200,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          const SizedBox(
            height: 430,
          ),
          Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.white, width: 2),
                  shape: const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                child: Text(
                  'Ver mas...',
                  style: GoogleFonts.pixelifySans(
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              );
            },
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      text: 'Tipo: ',
                      style: GoogleFonts.pixelifySans(
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      children: pokemon.types.map((type) {
                        return TextSpan(
                          text: '${type.type.name}, ',
                          style: TextStyle(
                            color: pokemon.getColorForType(type.type.name),
                            fontSize: 20,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                      8.0), // Ajusta el valor a tu preferencia
                  child: Text("Pokedex Nro: ${pokemon.id}",
                      style: GoogleFonts.pixelifySans(
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
