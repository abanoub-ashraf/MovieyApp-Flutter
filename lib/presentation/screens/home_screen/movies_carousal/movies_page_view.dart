import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moviey_app/domain/entities/movie_entity.dart';
import 'package:moviey_app/presentation/screens/home_screen/movies_carousal/animated_movie_card_widget.dart';
import 'package:moviey_app/presentation/screens/home_screen/movies_carousal/movie_card_widget.dart';

class MoviesPageView extends StatefulWidget {
    final List<MovieEntity> movies;
    final int initialPage;

    const MoviesPageView({ 
        Key? key,
        required this.movies,
        required this.initialPage
    }) : assert(
        initialPage >= 0,
        'initialPage cannot be less than 0'
    ),
    super(
        key: key
    );

    @override
    State<MoviesPageView> createState() => _MoviesPageViewState();
}

class _MoviesPageViewState extends State<MoviesPageView> {
    late PageController _pageController;

    @override
    void initState() {
        super.initState();

        _pageController = PageController(
            initialPage: widget.initialPage,
            keepPage: false,
            viewportFraction: 0.7,
        );
    }

    @override
    void dispose() {
        super.dispose();

        _pageController.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return Container(
            margin: EdgeInsets.symmetric(
                vertical: 10.h,
            ),
            height: ScreenUtil().screenHeight * 0.35,
            child: PageView.builder(
                itemBuilder: (context, index) {
                    final MovieEntity movie = widget.movies[index];

                    return AnimatedMovieCardWidget(
                        index: index,
                        pageController: _pageController,
                        movieId: movie.id!,
                        posterPath: movie.posterPath!, 
                    );
                },
                itemCount: widget.movies.length,
                controller: _pageController,
                pageSnapping: true,
                onPageChanged: (index) {}
            ),
        );
    }
}