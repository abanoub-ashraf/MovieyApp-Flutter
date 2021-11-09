// ignore_for_file: annotate_overrides, overridden_fields

import '../../domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
    final String? releaseDate;
    final bool? adult;
    final String? backdropPath;
    final List<int>? genreIds;
    final int? voteCount;
    final String? originalLanguage;
    final String? originalTitle;
    final String? posterPath;
    final bool? video;
    final int? id;
    final double? voteAverage;
    final String? title;
    final String? overview;
    final double? popularity;
    final String? mediaType;

    const MovieModel({
        this.releaseDate,
        this.adult,
        this.backdropPath,
        this.genreIds,
        this.voteCount,
        this.originalLanguage,
        this.originalTitle,
        this.posterPath,
        this.video,
        this.id,
        this.voteAverage,
        this.title,
        this.overview,
        this.popularity,
        this.mediaType
    }) : super(
        id: id,
        title: title,
        backdropPath: backdropPath,
        posterPath: posterPath,
        releaseDate: releaseDate,
        voteAverage: voteAverage,
        overview: overview,
    );

    factory MovieModel.fromJson(Map<String, dynamic> json) {
        return MovieModel(
            releaseDate         : json['release_date']              as String?      ?? 'null',
            adult               : json['adult']                     as bool?        ?? false,
            backdropPath        : json['backdrop_path']             as String?      ?? 'null',
            genreIds            : json['genre_ids'].cast<int>()     as List<int>?   ?? [],
            voteCount           : json['vote_count']                as int?         ?? 0,
            originalLanguage    : json['original_language']         as String?      ?? 'null',
            originalTitle       : json['original_title']            as String?      ?? 'null',
            posterPath          : json['poster_path']               as String?      ?? 'null',
            video               : json['video']                     as bool?        ?? false,
            id                  : json['id']                        as int?         ?? 0,
            voteAverage         : json['vote_average'].toDouble()   as double?      ?? 0.0,
            title               : json['title']                     as String?      ?? 'null',
            overview            : json['overview']                  as String?      ?? 'null',
            popularity          : json['popularity'].toDouble()     as double?      ?? 0.0,
            mediaType           : json['media_type']                as String?      ?? 'null',
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};

        data['release_date']            = releaseDate;
        data['adult']                   = adult;
        data['backdrop_path']           = backdropPath;
        data['genre_ids']               = genreIds;
        data['vote_count']              = voteCount;
        data['original_language']       = originalLanguage;
        data['original_title']          = originalTitle;
        data['poster_path']             = posterPath;
        data['video']                   = video;
        data['id']                      = id;
        data['vote_average']            = voteAverage;
        data['title']                   = title;
        data['overview']                = overview;
        data['popularity']              = popularity;
        data['media_type']              = mediaType;
        
        return data;
    }
}