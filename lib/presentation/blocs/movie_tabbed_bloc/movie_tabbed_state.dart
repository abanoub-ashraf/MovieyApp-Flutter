part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedState extends Equatable {
    final int currentTabIndex;

    const MovieTabbedState({
        required this.currentTabIndex
    });
    
    @override
    List<Object> get props => [
        currentTabIndex
    ];
}

class MovieTabbedInitial extends MovieTabbedState {
    const MovieTabbedInitial() 
        : super(
            currentTabIndex: 0
        );
}

class MovieTabbedTapChangedState extends MovieTabbedState {
    final List<MovieEntity> movies;

    const MovieTabbedTapChangedState({
        required int currentTabIndex,
        required this.movies,
    }) : super(
        currentTabIndex: currentTabIndex
    );

    @override
    List<Object> get props => [
        currentTabIndex,
        movies
    ];
}

class MovieTabbedErrorState extends MovieTabbedState {
    const MovieTabbedErrorState({
        required int currentTabIndex
    }) : super(
        currentTabIndex: currentTabIndex
    );
}