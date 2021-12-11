part of 'movies_carousal_bloc.dart';

abstract class MoviesCarousalState extends Equatable {
    const MoviesCarousalState();
    
    @override
    List<Object> get props => [];
}

class MoviesCarousalStateInitial extends MoviesCarousalState {}

class MoviesCarousalStateError extends MoviesCarousalState {}

class MoviesCarousalStateLoaded extends MoviesCarousalState {
    final List<MovieEntity> movies;
    final int defaultIndex;

    const MoviesCarousalStateLoaded({
        required this.movies,
        this.defaultIndex = 0,
    }) : assert(
        defaultIndex >= 0,
        'defaultIndex cannot be less than 0'
    );

    @override
    List<Object> get props => [
        movies, 
        defaultIndex
    ];
}
