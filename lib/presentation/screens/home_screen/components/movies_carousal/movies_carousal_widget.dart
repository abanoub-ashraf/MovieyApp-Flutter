import 'package:flutter/material.dart';
import '../../../../../domain/entities/movie_entity.dart';
import '../../../../widgets/movie_app_bar.dart';
import '../../../../widgets/separator_widget.dart';
import 'movie_data_widget.dart';
import 'movie_backdrop_widget.dart';
import 'movies_page_view.dart';

class MoviesCarousalWidget extends StatelessWidget {
    final GlobalKey<ScaffoldState> scaffoldKey;

    final List<MovieEntity> movies;
    final int defaultIndex;

    const MoviesCarousalWidget({ 
        Key? key,
        required this.movies,
        required this.defaultIndex,
        required this.scaffoldKey
    }) : assert(
        defaultIndex >= 0,
        'defaultIndex cannot be less than 0'
    ),
    super(
        key: key
    );

    @override
    Widget build(BuildContext context) {
        return Stack(
            fit: StackFit.expand,
            children: [
                const MovieBackdropWidget(),
                Column(
                    children: [
                        MovieAppBar(
                            scaffoldKey: scaffoldKey,
                        ),
                        MoviesPageView(
                            movies: movies,
                            initialPage: defaultIndex,
                        ),
                        const MovieDataWidget(),
                        const SeparatorWidget(),
                    ],
                ),
            ],
        );
    }
}