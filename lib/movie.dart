class Movie {
  final String title;
  final String description;
  final String posterUrl;
  final double rating;

  Movie({
    required this.title,
    required this.description,
    required this.posterUrl,
    this.rating = 0,
  });
}
