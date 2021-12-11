part of 'movies_carousal_bloc.dart';

abstract class MoviesCarousalEvent extends Equatable {
    const MoviesCarousalEvent();

    @override
    List<Object> get props => [];
}

class CarousalLoadEvent extends MoviesCarousalEvent {
    final int defaultIndex;

    ///
    /// assert is for testing conditions during debugging/development
    ///
    const CarousalLoadEvent({
        this.defaultIndex = 0
    }): assert(
        defaultIndex >= 0, 
        'defaultIndex cannot be less than 0'
    );

    @override
    List<Object> get props => [
        defaultIndex
    ];
}