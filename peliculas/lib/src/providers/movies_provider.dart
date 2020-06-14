
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:peliculas/src/models/movies_model.dart';

class MoviesProvider{
  String _apiKey  = 'de4c5723f2c97517f2241cc13446df0b';
  String _url     = 'api.themoviedb.org';
  String _language = 'es-MX';


  Future<List<Movie>> getNowPlaying() async{
    final url = Uri.https(_url, '3/movie/now_playing',{
    'api_key'  : _apiKey,
    'language' : _language
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

     final movies = new Movies.fromJsonList(decodedData['results']);

    //  print(movies.items[0].title);
    return movies.items;
  }

  Future<List<Movie>> getPupularMovies() async{
    final url = Uri.https(_url, '3/movie/popular',{
    'api_key'  : _apiKey,
    'language' : _language
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

     final movies = new Movies.fromJsonList(decodedData['results']);

      print(movies.items[0].title);
    return movies.items;
  }
}