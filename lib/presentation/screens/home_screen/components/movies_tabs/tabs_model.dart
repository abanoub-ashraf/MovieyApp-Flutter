///
/// to store the index and the name of the tab in the home screen
///
class TabsModel {
    final int index;
    final String title;

    const TabsModel({
        required this.index,
        required this.title,
    }) : assert(
        index >= 0,
        'index cannot be negative'
    );
}