import 'package:flutter/material.dart';
import 'package:app_movie/src/services/movies_service.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String movieId = ModalRoute.of(context)!.settings.arguments as String;
    final MovieService movieService = MovieService();

    return FutureBuilder(
      future: movieService.getMovieById(movieId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text("Error al cargar los detalles"));
        }

        var movie = snapshot.data;
        return Scaffold(
          appBar: AppBar(title: Text(movie?.title ?? "Película")),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.network(movie?.imageUrl ?? ''),
                Text("Año: ${movie?.year}"),
                Text("Director: ${movie?.director}"),
                Text("Género: ${movie?.genre}"),
                Text("Sinopsis: ${movie?.synopsis}"),
              ],
            ),
          ),
        );
      },
    );
  }
}
