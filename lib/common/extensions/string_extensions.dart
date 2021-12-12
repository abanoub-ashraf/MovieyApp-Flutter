///
/// we will use this extension on the title of the movie in the cards of the movie tabs
/// if the title string contains more than 15 letters then get the first 15 only and then dots
/// else get the complete title strings
///
extension StringExtension on String {
    String intelliTrim() {
        return length > 15 
            ? '${substring(0, 15)}...' 
            : this;
    }
}