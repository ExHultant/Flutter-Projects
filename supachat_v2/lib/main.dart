import 'package:flutter/material.dart';
import 'package:supachat_v2/pages/login_page.dart';
import 'package:supachat_v2/utils/constans.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supachat_v2/pages/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://vwpoimuqtehzgmdbqcdu.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ3cG9pbXVxdGVoemdtZGJxY2R1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTIwODYyNzIsImV4cCI6MjAyNzY2MjI3Mn0.owm0BKGgy_VZlIUynEYWEInijjPuqFyEEsDo5apMvs4',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const LoginPage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'My Chat App',
      theme: appTheme,
      home: const SplashPage(),
    );
  }
}
