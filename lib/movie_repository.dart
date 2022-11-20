import 'dart:convert';

import 'package:movieapp/movie.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  static const _apiKey = "432edc9ce055453555ec06b7273e5169";

  static final MovieRepository _instance = MovieRepository._internal();

  factory MovieRepository() {
    return _instance;
  }

  MovieRepository._internal();

  Future<List<Movie>> getMovies() async {
    final res = await http.get(
      Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&language=en-US&page=1",
      ),
    );

    final data = jsonDecode(res.body)['results'];

    return data
        .map<Movie>((movie) => Movie(
              title: movie['title'],
              description: movie['overview'],
              posterUrl: movie['poster_path'],
              rating: movie['vote_average'].toDouble(),
            ))
        .toList();
  }
}
