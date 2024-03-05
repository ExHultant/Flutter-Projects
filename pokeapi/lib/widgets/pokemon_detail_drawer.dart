import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokeapi/models/pokemon.dart';

class PokemonDetailDrawer extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonDetailDrawer(this.pokemon, {Key? key}) : super(key: key);

  @override
  State<PokemonDetailDrawer> createState() => _PokemonDetailDrawerState();
}

class _PokemonDetailDrawerState extends State<PokemonDetailDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: const Color.fromARGB(255, 31, 29, 28),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pokeball.png'),
            alignment: Alignment.centerLeft,
            fit: BoxFit.fitHeight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 212, 98, 45),
              ),
              child: Column(
                children: [
                  Text(
                    'Detalles del Pokemon',
                    style: GoogleFonts.pixelifySans(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  Image.network(
                    widget.pokemon.imageUrl,
                    fit: BoxFit.cover,
                    height: 100,
                    width: 200,
                  ),
                ],
              ),
            ),
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Nombre: ${widget.pokemon.name}',
                    style: GoogleFonts.pixelifySans(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Text(
                    'Altura: ${widget.pokemon.height} m',
                    style: GoogleFonts.pixelifySans(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Text(
                    'Peso: ${widget.pokemon.weight} kg',
                    style: GoogleFonts.pixelifySans(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Text(
                    'Habilidades: ${widget.pokemon.abilities.map((ability) => ability.ability.name).join(', ')}',
                    style: GoogleFonts.pixelifySans(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Text(
                    'Experiencia base: ${widget.pokemon.baseExperience} XP',
                    style: GoogleFonts.pixelifySans(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Text(
                    'Velocidad: ${widget.pokemon.stats[0].baseStat}',
                    style: GoogleFonts.pixelifySans(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Text(
                    'Defensa especial: ${widget.pokemon.stats[1].baseStat}',
                    style: GoogleFonts.pixelifySans(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Text(
                    'Ataque: ${widget.pokemon.stats[4].baseStat}',
                    style: GoogleFonts.pixelifySans(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Text(
                    'HP: ${widget.pokemon.stats[5].baseStat}',
                    style: GoogleFonts.pixelifySans(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Text(
                    'Especies: ${widget.pokemon.species.name}',
                    style: GoogleFonts.pixelifySans(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Text(
                    'ID: ${widget.pokemon.id}',
                    style: GoogleFonts.pixelifySans(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Text(
                    'Orden: ${widget.pokemon.order}',
                    style: GoogleFonts.pixelifySans(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Text(
                    'Pokemon Inicial: ${widget.pokemon.isDefault}',
                    style: GoogleFonts.pixelifySans(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Text(
                    'Localizacion: ${widget.pokemon.locationAreaEncounters}',
                    style: GoogleFonts.pixelifySans(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Text(
                    'Tipo: ${widget.pokemon.types.map((type) => type.type.name).join(', ')}',
                    style: GoogleFonts.pixelifySans(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
