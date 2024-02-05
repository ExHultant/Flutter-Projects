import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

//CLase PRINCIPAL
class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

//ESTADO DEL HOMEPAGE
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int _number = 0;

//LA CLASE DE LA HOMEPAGE DONDE ESCRIBIRE CODIGO
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context);

    void _CounterPlus() {
      setState(() {
        _number++;
      });
    }

    void _DecrementPlus() {
      setState(() {
        _number--;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contador"),
        foregroundColor: Colors.white,
        backgroundColor: colors.primaryColor,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            _number.toString(),
            style: TextStyle(color: colors.primaryColor, fontSize: 48),
          ),
          _number < 0 ? const Text("Eres loco mano?") : SizedBox(),
          ElevatedButton.icon(
              onPressed: _CounterPlus,
              icon: const Icon(Icons.plus_one),
              label: const Text("Suma")),
          ElevatedButton.icon(
              onPressed: _DecrementPlus,
              icon: const Icon(Icons.accessible_forward_sharp),
              label: const Text("Resta"))
        ],
      )),
    );
  }
}
