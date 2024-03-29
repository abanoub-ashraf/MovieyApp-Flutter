import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../drawer_screen/navigation_drawer_screen.dart';
import 'components/movies_carousal/movies_carousal_widget.dart';
import 'components/movies_tabs/movie_tabs_widget.dart';
import '../../../di/get_it.dart';
import '../../blocs/movie_backdrop_bloc/movie_backdrop_bloc.dart';
import '../../blocs/movie_tabbed_bloc/movie_tabbed_bloc.dart';
import '../../blocs/movies_carousal_bloc/movies_carousal_bloc.dart';

class HomeScreen extends StatefulWidget {
    const HomeScreen({ Key? key }) : super(key: key);

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    late MoviesCarousalBloc moviesCarousalBloc;
    late MovieBackdropBloc movieBackdropBloc;
    late MovieTabbedBloc movieTabbedBloc;

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    @override
    void initState() {
        super.initState();

        moviesCarousalBloc = getItInstance<MoviesCarousalBloc>();

        ///
        /// if we initialized this one like the one above it, the background
        /// of the movie won't show cause the bloc won't be instantiated
        /// but this way makes sure that we use the backdrop bloc from the 
        /// carousal bloc after it's initialized
        ///
        movieBackdropBloc  = moviesCarousalBloc.movieBackdropBloc;

        movieTabbedBloc = getItInstance<MovieTabbedBloc>();

        moviesCarousalBloc.add(const CarousalLoadEvent());
    }

    @override
    void dispose() {
        super.dispose();

        moviesCarousalBloc.close();
        movieBackdropBloc.close();
        movieTabbedBloc.close();
    }

    @override
    Widget build(BuildContext context) {
        ///
        /// we provided the movies carousal bloc only to this screen
        ///
        return MultiBlocProvider(
            providers: [
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
                BlocProvider(
                    create: (context) => moviesCarousalBloc,
                ),
                ///
                /// same as the bloc provider above this one
                ///
                BlocProvider(
                    create: (context) => movieBackdropBloc,
                ),
                BlocProvider(
                    create: (context) => movieTabbedBloc,
                ),
            ],
            child: Scaffold(
                key: _scaffoldKey,
                drawer: const NavigationDrawerScreen(),
                body: BlocBuilder<MoviesCarousalBloc, MoviesCarousalState>(
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
                                                scaffoldKey: _scaffoldKey,
                                            ),
                                        ),
                                        const FractionallySizedBox(
                                            alignment: Alignment.bottomCenter,
                                            heightFactor: 0.4,
                                            child: MovieTabsWidget(),
                                        ),
                                        // SizedBox(height: 20.h),
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
            ),
        );
    }
}