/// These are details books in the saved list will contain.
class SavedBook {
  ///Constructor
  SavedBook({
    required this.id,
    required this.title,
    required this.author,
    required this.imgUrl,
    required this.viewUrl,
    required this.downloadUrl,
  });

  /// Book id for CRUD operations
  String id;

  /// Book title
  String title;

  /// Book Author
  String author;

  /// Book Cover Image
  String imgUrl;

  /// Book Url for downloading
  String downloadUrl;

  /// Book Url for viewing in the App
  String viewUrl;
}
