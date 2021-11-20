import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:the_movies/infra/shared/rest_client/rest_client.dart';
import 'package:the_movies/models/movies_model.dart';

import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RestClient _restClient;

  MoviesRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final result = await _restClient.get('/movie/popular', query: {
      'api_key': RemoteConfig.instance.getString('api_token'),
      'language': 'pt-br',
      'page': '1'
    }, decoder: (data) {
      final result = data['results'];
      if (result != null) {
        return result.map<MoviesModel>((item) {
          return MoviesModel.fromJson(item);
        }).toList();
      }
      return <MoviesModel>[];
    });

    if (result.hasError) {
      throw 'Erro no repository';
    }

    return result.body ?? <MoviesModel>[];
  }

  @override
  Future<List<MoviesModel>> getTopRetedMovies() async {
    final result = await _restClient.get('/movie/top_rated', query: {
      'api_key': RemoteConfig.instance.getString('api_token'),
      'language': 'pt-br',
      'page': '1'
    }, decoder: (data) {
      final result = data['results'];
      if (result != null) {
        return result.map<MoviesModel>((item) {
          return MoviesModel.fromJson(item);
        }).toList();
      }
      return <MoviesModel>[];
    });

    if (result.hasError) {
      throw 'Erro no repository';
    }

    return result.body ?? <MoviesModel>[];
  }
}
