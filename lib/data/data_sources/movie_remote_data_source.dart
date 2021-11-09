import '../models/movie_model.dart';

abstract class MovieRemoteDataSource {
    Future<List<MovieModel>> getTrending();
    Future<List<MovieModel>> getPopular();
    Future<List<MovieModel>> getPlayingNow();
    Future<List<MovieModel>> getComingSoon();
}