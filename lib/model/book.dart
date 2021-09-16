class Book {
  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.imgUrl,
    required this.viewUrl,
    required this.downloadUrl,
    this.saveStatus = false,
  });

  String id;
  String title;
  String author;
  String imgUrl;
  bool saveStatus;
  String downloadUrl;
  String viewUrl;
}
