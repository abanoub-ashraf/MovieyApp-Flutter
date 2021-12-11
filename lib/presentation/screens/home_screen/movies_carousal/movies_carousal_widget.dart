import 'package:flutter/material.dart';
import 'package:moviey_app/domain/entities/movie_entity.dart';
import 'package:moviey_app/presentation/widgets/movie_app_bar.dart';

import 'movies_page_view.dart';

class MoviesCarousalWidget extends StatelessWidget {
    final List<MovieEntity> movies;
    final int defaultIndex;

    const MoviesCarousalWidget({ 
        Key? key,
        required this.movies,
        required this.defaultIndex
    }) : assert(
        defaultIndex >= 0,
        'defaultIndex cannot be less than 0'
    ),
    super(
        key: key
    );

    @override
    Widget build(BuildContext context) {
        return Column(
            children: [
                const MovieAppBar(),
                MoviesPageView(
                    movies: movies,
                    initialPage: defaultIndex,
                ),
            ],
        );
    }
}