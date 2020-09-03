import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:peliculas/src/models/movies_model.dart';

class MoviesProvider {
  String _apiKey = 'de4c5723f2c97517f2241cc13446df0b';
  String _url = 'api.themoviedb.org';
  String _language = 'es-MX';

  int _popularesPage = 0;
  bool _cargando = false;

  List<Movie> _populares = new List();

  //creación de la tubería
  final _popularesStreamController = StreamController<List<Movie>>.broadcast();

  //insertar, obtener info
  Function(List<Movie>) get popularesSink =>
      _popularesStreamController.sink.add;
  Stream<List<Movie>> get popularesStream => _popularesStreamController.stream;

  void disposeStreams() {
    _popularesStreamController?.close();
  }

  Future<List<Movie>> getNowPlaying() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language});

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final movies = new Movies.fromJsonList(decodedData['results']);

    //  print(movies.items[0].title);
    return movies.items;
  }

  Future<List<Movie>> getPupularMovies() async {
    _popularesPage++;

    if (_cargando) return [];
    _cargando = true;

    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': _popularesPage.toString()
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final movies = new Movies.fromJsonList(decodedData['results']);

    // print(movies.items[0].title);
    _populares.addAll(movies.items);
    popularesSink(_populares);
    print(_popularesPage.toString());
    _cargando = false;
    return movies.items;
  }
}
