import 'package:flutter/material.dart';
import 'src/screens/home_screen.dart';
import 'package:app_movie/src/screens/login_screen.dart';
import 'package:app_movie/src/screens/register_screen.dart';
import 'package:app_movie/src/screens/movie_catalog_screen.dart';
import 'package:app_movie/src/screens/movie_detail_screen.dart';
import 'package:app_movie/src/screens/admin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo de Películas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/movieCatalog': (context) => MovieCatalogScreen(),
        '/movieDetail': (context) => const MovieDetailScreen(),
        '/admin': (context) => const AdminScreen(),
      },
    );
  }
}
