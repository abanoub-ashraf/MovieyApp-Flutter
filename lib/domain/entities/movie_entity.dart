// ignore_for_file: tighten_type_of_initializing_formals

import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
    final String? posterPath;
    final int? id;
    final String? backdropPath;
    final String? title;
    final num? voteAverage;
    final String? releaseDate;
    final String? overview;

    const MovieEntity({
        this.posterPath,
        this.id,
        this.backdropPath,
        this.title,
        this.voteAverage,
        this.releaseDate,
        this.overview,
    }) : assert(id != null, 'Movie id must not be null');

    ///
    /// The list of properties that will be used to determine whether two instances are equal
    ///
    @override
    List<Object?> get props => [id, title];

    ///
    /// whenever i print a movie object i will see its properties (id and title) in the console
    /// because of the getter line above
    ///
    @override
    bool? get stringify => true;
}