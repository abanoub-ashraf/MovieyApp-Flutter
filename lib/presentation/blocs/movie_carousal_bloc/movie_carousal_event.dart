part of 'movie_carousal_bloc.dart';

abstract class MovieCarousalEvent extends Equatable {
    const MovieCarousalEvent();

    @override
    List<Object> get props => [];
}

class CarousalLoadEvent extends MovieCarousalEvent {
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