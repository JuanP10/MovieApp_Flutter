import 'package:flutter/material.dart';
import 'package:app_movie/src/services/movies_service.dart';
import '../models/movie.dart';

class MovieCatalogScreen extends StatelessWidget {
  final MovieService _movieService = MovieService();

  MovieCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Catálogo de Películas")),
      body: FutureBuilder<List<Movie>>(
        future: _movieService.getMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Error al cargar las películas"));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No hay películas disponibles"));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var movie = snapshot.data![index];
              return ListTile(
                title: Text(movie.title),
                leading: Image.network(movie.imageUrl),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/movieDetail',
                    arguments: movie.id,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
