import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../domain/entities/movie_entity.dart';
import 'movie_card_widget.dart';

class MovieTabbedListViewWidget extends StatelessWidget {
    final List<MovieEntity> movies;

    const MovieTabbedListViewWidget({
        Key? key,
        required this.movies,
    }) : super(
        key: key
    );

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: EdgeInsets.symmetric(
                vertical: 6.h
            ),
            child: ListView.separated(
                shrinkWrap: true,
                itemCount: movies.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                    return SizedBox(
                        width: 14.w,
                    );
                }, 
                itemBuilder: (context, index) {
                    final MovieEntity movie = movies[index];
                    return MovieCardWidget(
                        movieId: movie.id!, 
                        title: movie.title!, 
                        posterPath: movie.posterPath!
                    );
                }, 
            ),
        );
    }
}