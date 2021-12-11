import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviey_app/presentation/blocs/movie_backdrop_bloc/movie_backdrop_bloc.dart';

class MovieDataWidget extends StatelessWidget {
    const MovieDataWidget({ Key? key }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return BlocBuilder<MovieBackdropBloc, MovieBackdropState>(
            builder: (context, state) {
                if (state is MovieBackdropChangedState) {
                    return Text(
                        state.movie.title ?? 'UNTITLED',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: Theme.of(context).textTheme.headline6,
                    );
                }
                return const SizedBox.shrink();
            }
        );
    }
}