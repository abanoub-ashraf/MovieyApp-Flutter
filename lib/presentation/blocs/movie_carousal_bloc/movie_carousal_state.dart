part of 'movie_carousal_bloc.dart';

abstract class MovieCarousalState extends Equatable {
    const MovieCarousalState();
    
    @override
    List<Object> get props => [];
}

class MovieCarousalStateInitial extends MovieCarousalState {}

class MovieCarousalStateError extends MovieCarousalState {}

class MovieCarousalStateLoaded extends MovieCarousalState {
    final List<MovieEntity> movies;
    final int defaultIndex;

    const MovieCarousalStateLoaded({
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
