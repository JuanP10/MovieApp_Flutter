import 'package:flutter/material.dart';
import '../models/movie.dart';
import 'package:app_movie/src/services/movies_service.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  AdminScreenState createState() => AdminScreenState();
}

class AdminScreenState extends State<AdminScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController directorController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  final TextEditingController synopsisController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  final MovieService _movieService = MovieService();

  void _addMovie() async {
    final movie = Movie(
      id: '', // El ID será generado automáticamente
      title: titleController.text,
      year: yearController.text,
      director: directorController.text,
      genre: genreController.text,
      synopsis: synopsisController.text,
      imageUrl: imageUrlController.text,
    );

    try {
      await _movieService.addMovie(movie);
      // Verificamos si el widget sigue montado antes de usar context
      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      // Manejo de errores (si es necesario)
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error al agregar película')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Administración de Películas")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Título')),
            TextField(
                controller: yearController,
                decoration: const InputDecoration(labelText: 'Año')),
            TextField(
                controller: directorController,
                decoration: const InputDecoration(labelText: 'Director')),
            TextField(
                controller: genreController,
                decoration: const InputDecoration(labelText: 'Género')),
            TextField(
                controller: synopsisController,
                decoration: const InputDecoration(labelText: 'Sinopsis')),
            TextField(
                controller: imageUrlController,
                decoration: const InputDecoration(labelText: 'URL de imagen')),
            ElevatedButton(
                onPressed: _addMovie, child: const Text("Agregar Película")),
          ],
        ),
      ),
    );
  }
}
