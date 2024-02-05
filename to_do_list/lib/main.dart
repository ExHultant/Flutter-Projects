import 'package:flutter/material.dart';

import 'pages/my_home_page.dart';
// import 'package:to_do_list/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(primaryColor: Colors.yellow[800]),
    );
  }
}
