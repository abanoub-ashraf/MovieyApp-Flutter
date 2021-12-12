import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../blocs/movie_tabbed_bloc/movie_tabbed_bloc.dart';
import 'movie_tabs_constants.dart';
import 'movie_tabs_list_view_widget.dart';
import 'tabs_title_widget.dart';

class MovieTabsWidget extends StatefulWidget {
    const MovieTabsWidget({ Key? key }) : super(key: key);

    @override
    _MovieTabsWidgetState createState() => _MovieTabsWidgetState();
}

class _MovieTabsWidgetState extends State<MovieTabsWidget> {
    MovieTabbedBloc get movieTabbedBloc => BlocProvider.of<MovieTabbedBloc>(context);

    int currentTabIndex = 0;

    @override
    void initState() {
        super.initState();

        ///
        /// to brings the movies of the initial index once the app loads
        ///
        movieTabbedBloc.add(
            MovieTabbedChangedEvent(
                currentTabIndex: currentTabIndex
            )
        );
    }

    @override
    void dispose() {
        super.dispose();

        movieTabbedBloc.close();
    }

    ///
    /// each tap the user does on any tap will trigger this event
    /// to get a state from the bloc with that index and the movies
    /// associated with it 
    ///
    void _onTabTapped(int index) {
        movieTabbedBloc.add(
            MovieTabbedChangedEvent(currentTabIndex: index)
        );
    }

    @override
    Widget build(BuildContext context) {
        return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
            builder: (context, state) {
                return Padding(
                    padding: EdgeInsets.only(
                        bottom: 8.h,
                    ),
                    child: Column(
                        children: [
                            Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                    for (var i = 0; i < MovieTabbedConstants.movieTabs.length; i++)
                                        TabsTitleWidget(
                                            title: MovieTabbedConstants.movieTabs[i].title, 
                                            onTap: () => _onTabTapped(i),
                                            isSelected: MovieTabbedConstants.movieTabs[i].index == state.currentTabIndex,
                                        ),
                                ],
                            ),
                            if (state is MovieTabbedTapChangedState)
                                Expanded(
                                    child: MovieTabbedListViewWidget(
                                        movies: state.movies
                                    ),
                                ),
                        ],
                    ),
                );
            }
        );
    }
}