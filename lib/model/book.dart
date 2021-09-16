/// These are the details each book contians
class Book {
  ///Constructor
  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.imgUrl,
    required this.viewUrl,
    required this.downloadUrl,
    this.saveStatus = false,
  });

  /// Book id for CRUD operations
  String id;

  /// Book title 
  String title;

  /// Book Author
  String author;

  /// Book Cover Image
  String imgUrl;

  /// Book save status of each user
  bool saveStatus;

  /// Book Url for downloading
  String downloadUrl;

  /// Book Url for viewing in the App
  String viewUrl;
}
