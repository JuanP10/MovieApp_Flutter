class Movie {
  final String id;
  final String title;
  final String year;
  final String director;
  final String genre;
  final String synopsis;
  final String imageUrl;

  Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.director,
    required this.genre,
    required this.synopsis,
    required this.imageUrl,
  });

  factory Movie.fromMap(Map<String, dynamic> data, String documentId) {
    return Movie(
      id: documentId,
      title: data['title'],
      year: data['year'],
      director: data['director'],
      genre: data['genre'],
      synopsis: data['synopsis'],
      imageUrl: data['image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'year': year,
      'director': director,
      'genre': genre,
      'synopsis': synopsis,
      'image': imageUrl,
    };
  }
}
