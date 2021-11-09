import 'movie_model.dart';

class MoviesResultModel {
    late final List<MovieModel>? movies;
    
    MoviesResultModel({
        this.movies,
    });

    MoviesResultModel.fromJson(Map<String, dynamic> json) {
        if (json['results'] != null) {
            movies = <MovieModel>[];
            json['results'].forEach((jsonSingleResult) {
                movies?.add(MovieModel.fromJson(jsonSingleResult as Map<String, dynamic>));
            });
        }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};

        if (movies != null) {
            data['results'] = movies?.map(
                (v) => v.toJson()
            ).toList();
        }

        return data;
    }
}