import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/movie.dart';

class MovieService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Obtener lista de películas desde Firestore
  Future<List<Movie>> getMovies() async {
    var snapshot = await _db.collection('movies').get();
    return snapshot.docs
        .map((doc) => Movie.fromMap(doc.data(), doc.id))
        .toList();
  }

  // Obtener detalles de una película
  Future<Movie> getMovieById(String movieId) async {
    var doc = await _db.collection('movies').doc(movieId).get();
    return Movie.fromMap(doc.data()!, doc.id);
  }

  // Agregar una nueva película
  Future<void> addMovie(Movie movie) async {
    await _db.collection('movies').add(movie.toMap());
  }

  // Eliminar una película
  Future<void> deleteMovie(String movieId) async {
    await _db.collection('movies').doc(movieId).delete();
  }
}
