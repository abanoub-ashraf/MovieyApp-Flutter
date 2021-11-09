import '../core/api_client.dart';
import '../core/api_constants.dart';
import '../models/movie_model.dart';
import '../models/movies_result_model.dart';
import 'movie_remote_data_source.dart';

class MovieRemoteDataSourceImplementation extends MovieRemoteDataSource {
    final ApiClient _client;

    MovieRemoteDataSourceImplementation(this._client);

    @override
    Future<List<MovieModel>> getTrending() async {
        final response = await _client.get(ApiConstants.GET_TRENDING_MOVIES);
        
        final movies = MoviesResultModel.fromJson(response as Map<String, dynamic>).movies;
        
        return movies ?? [];
    }

    @override
    Future<List<MovieModel>> getPopular() async {
        final response = await _client.get(ApiConstants.GET_POPULAR_MOVIES);

        final movies = MoviesResultModel.fromJson(response as Map<String, dynamic>).movies;
        
        return movies ?? [];
    }

    @override
    Future<List<MovieModel>> getPlayingNow() async {
        final response = await _client.get(ApiConstants.GET_PLAYING_NOW_MOVIES);

        final movies = MoviesResultModel.fromJson(response as Map<String, dynamic>).movies;
        
        return movies ?? [];
    }

    @override
    Future<List<MovieModel>> getComingSoon() async {
        final response = await _client.get(ApiConstants.GET_COMING_SOON_MOVIES);

        final movies = MoviesResultModel.fromJson(response as Map<String, dynamic>).movies;
        
        return movies ?? [];
    }
}