import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:the_movies/infra/shared/rest_client/rest_client.dart';
import 'package:the_movies/models/genre_model.dart';

import 'genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  final RestClient _restClient;

  GenresRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<GenreModel>> getGenres() async {
    final result = await _restClient.get(
      '/genre/movie/list',
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
      },
    );

    if (result.hasError) {
      throw Exception('Error ao buscar Genres');
    }

    final temp = result.body['genres'];

    return temp.map<GenreModel>((genre) => GenreModel.fromJson(genre)).toList();
  }
}
