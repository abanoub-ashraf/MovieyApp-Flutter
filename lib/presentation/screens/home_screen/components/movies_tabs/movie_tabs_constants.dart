import '../../../../../common/constants/app_strings.dart';
import 'tabs_model.dart';

class MovieTabbedConstants {
    static const List<TabsModel> movieTabs = [
        TabsModel(
            index: 0, 
            title: AppStrings.popularMovies 
        ),
        TabsModel(
            index: 1, 
            title: AppStrings.playingNowMovies
        ),
        TabsModel(
            index: 2, 
            title: AppStrings.comingSoonMovies
        ),
    ];
}