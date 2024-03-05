import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokeapi/const/pokemon_services.dart';
import 'package:pokeapi/models/pokemon.dart';

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
                flex: 1, // Reducir el ancho del detalle del Pokemon
                child: selectedPokemon != null
                    ? pokemonDetail(selectedPokemon!)
                    : const Center(child: Text('Select a Pokemon')),
              ),
              Expanded(
                flex: 2, // Aumentar el ancho de la lista de Pokemon
                child: Container(
                  margin: const EdgeInsets.all(
                      10), // Agregar margen alrededor de la lista
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
                        padding: const EdgeInsets.all(
                            8.0), // Ajusta el valor a tu preferencia
                        child: Container(
                          decoration: selectedPokemon == pokemonList[index]
                              ? BoxDecoration(
                                  border: Border.all(
                                    color: const Color.fromARGB(255, 23, 83,
                                        25), // Color del borde cuando está seleccionado
                                    width: 2, // Ancho del borde
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      10), // Bordes redondeados
                                )
                              : null, // Sin decoración cuando no está seleccionado
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
                fit: BoxFit.contain,
              ),
            ),
          ),
          Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
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
                  padding: const EdgeInsets.all(
                      8.0), // Ajusta el valor a tu preferencia
                  child: RichText(
                    text: TextSpan(
                      text: 'Type: ',
                      style: GoogleFonts.pixelifySans(
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      children: pokemon.types.map((type) {
                        return TextSpan(
                          text:
                              '${type.type.name}, ', // Suponiendo que 'value' es la propiedad que contiene el valor del tipo
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
                  child: Text("Pokedex No: ${pokemon.id}",
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

class PokemonDetailDrawer extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailDrawer(this.pokemon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 212, 98, 45),
              ),
              child: Text(
                'Detalles del Pokemon',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              )),
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Nombre: ${pokemon.name}',
                  style: GoogleFonts.pixelifySans(
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Text(
                  'Altura: ${pokemon.height} m',
                  style: GoogleFonts.pixelifySans(
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Text(
                  'Peso: ${pokemon.weight} kg',
                  style: GoogleFonts.pixelifySans(
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Text(
                  'Habilidades: ${pokemon.abilities.map((ability) => ability.ability.name).join(', ')}',
                  style: GoogleFonts.pixelifySans(
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Text(
                  'Experiencia base: ${pokemon.baseExperience} XP',
                  style: GoogleFonts.pixelifySans(
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Text(
                  'Velocidad: ${pokemon.stats[0].baseStat}',
                  style: GoogleFonts.pixelifySans(
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Text(
                  'Defensa especial: ${pokemon.stats[1].baseStat}',
                  style: GoogleFonts.pixelifySans(
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Text(
                  'Ataque: ${pokemon.stats[4].baseStat}',
                  style: GoogleFonts.pixelifySans(
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Text(
                  'HP: ${pokemon.stats[5].baseStat}',
                  style: GoogleFonts.pixelifySans(
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Text(
                  'Especies: ${pokemon.species.name}',
                  style: GoogleFonts.pixelifySans(
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Text(
                  'ID: ${pokemon.id}',
                  style: GoogleFonts.pixelifySans(
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Text(
                  'Orden: ${pokemon.order}',
                  style: GoogleFonts.pixelifySans(
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Text(
                  'Pokemon Inicial: ${pokemon.isDefault}',
                  style: GoogleFonts.pixelifySans(
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Text(
                  'Localizacion: ${pokemon.locationAreaEncounters}',
                  style: GoogleFonts.pixelifySans(
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Text(
                  'Tipo: ${pokemon.types.map((type) => type.type.name).join(', ')}',
                  style: GoogleFonts.pixelifySans(
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
