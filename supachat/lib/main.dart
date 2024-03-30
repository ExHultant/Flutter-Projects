import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:supachat/pages/splash_page.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ikhtmgfqjvxttzhhygzw.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlraHRtZ2ZxanZ4dHR6aGh5Z3p3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE3NzgzNzcsImV4cCI6MjAyNzM1NDM3N30.qjYCt2dJgzTC7WBU9ZeKI4c_u0Z2r3c7JYLcUYUbrfI'
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(
        scheme: FlexScheme.deepOrangeM3,
        useMaterial3: true,
        useMaterial3ErrorColors: true,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.deepOrangeM3,
        useMaterial3: true,
        useMaterial3ErrorColors: true,
      ),
      themeMode: ThemeMode.system,
      home: const SplashPage(),
    );
  }
}
