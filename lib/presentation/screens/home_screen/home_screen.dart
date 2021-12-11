import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviey_app/di/get_it.dart';
import 'package:moviey_app/presentation/blocs/movies_carousal_bloc/movies_carousal_bloc.dart';

import 'movies_carousal/movies_carousal_widget.dart';

class HomeScreen extends StatefulWidget {
    const HomeScreen({ Key? key }) : super(key: key);

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    late MoviesCarousalBloc moviesCarousalBloc;

    @override
    void initState() {
        super.initState();

        moviesCarousalBloc = getItInstance<MoviesCarousalBloc>();

        moviesCarousalBloc.add(const CarousalLoadEvent());
    }

    @override
    void dispose() {
        super.dispose();

        moviesCarousalBloc.close();
    }

    @override
    Widget build(BuildContext context) {
        ///
        /// we provided the movies carousal bloc only to this screen
        ///
        return BlocProvider<MoviesCarousalBloc>(
            ///
            /// - when we create the bloc we wanna provide to this screen, it requires
            ///   an instance of get trending use case which means that's a dependency injection,
            ///   so we defined that injection inside the di folder then created the instance of 
            ///   the bloc we are using here inside the init state of this screen then used that
            ///   instance in here
            /// 
            /// - instead of defining the carousal bloc instance here and then define an object
            ///   of the get trending use case for that and that's a dependency injection
            ///
            create: (context) => moviesCarousalBloc,
            child: BlocBuilder<MoviesCarousalBloc, MoviesCarousalState>(
                bloc: moviesCarousalBloc,
                builder: (context, state) {
                    if (state is MoviesCarousalStateLoaded) {
                        return Scaffold(
                            body: Stack(
                                ///
                                /// allows the stack to take all the available space
                                ///
                                fit: StackFit.expand,
                                children: [
                                    FractionallySizedBox(
                                        alignment: Alignment.topCenter,
                                        heightFactor: 0.6,
                                        child: MoviesCarousalWidget(
                                            movies: state.movies,
                                            defaultIndex: state.defaultIndex,
                                        ),
                                    ),
                            
                                    const FractionallySizedBox(
                                        alignment: Alignment.bottomCenter,
                                        heightFactor: 0.4,
                                        child: Placeholder(
                                            color: Colors.green,
                                        ),
                                    )
                                ],
                            ),
                        );
                    }
                    
                    ///
                    /// if the movie carousal state is the error state
                    ///
                    return const SizedBox.shrink();
                }
            ),
        );
    }
}