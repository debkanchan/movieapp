import 'package:movieapp/movie.dart';
import 'package:movieapp/movie_repository.dart';

class MovieService {
  static final MovieService _instance = MovieService._internal();

  factory MovieService() {
    return _instance;
  }

  MovieService._internal();

  Future<List<Movie>>getMovies() {
    final repo = MovieRepository();

    return repo.getMovies();
  }
}