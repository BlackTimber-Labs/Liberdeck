import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../provider/books_provider.dart';
import '../provider/saved_book_provider.dart';
import '../screens/pdf_view_screen.dart';

class BookTile extends StatefulWidget {
  const BookTile({
    required this.downloadUrl,
    required this.viewUrl,
    required this.id,
    required this.title,
    required this.author,
    required this.imgUrl,
    required this.saveStatus,
    required this.height,
    required this.width,
    required this.userID,
  });
  @override
  _BookTileState createState() => _BookTileState();

  final String userID;
  final String id;
  final String title;
  final String author;
  final String imgUrl;
  final String viewUrl;
  final String downloadUrl;
  final bool saveStatus;
  final double height;
  final double width;
}

class _BookTileState extends State<BookTile> {
  @override
  Widget build(BuildContext context) {
    final double height = widget.height;
    final double width = widget.width;
    final SavedBooksProvider provider =
        Provider.of<SavedBooksProvider>(context);
    final BooksProvider booksProvider = Provider.of<BooksProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.02,
        horizontal: width * 0.03,
      ),
      height: height * 0.37,
      width: width,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: height * 0.33,
                width: width * 0.5,
                child: CachedNetworkImage(
                  imageUrl: widget.imgUrl,
                  fit: BoxFit.fill,
                  placeholder: (
                    BuildContext context,
                    String url,
                  ) =>
                      const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (
                    BuildContext context,
                    String url,
                    dynamic error,
                  ) =>
                      const Icon(Icons.error),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.02,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: height * 0.1,
                        width: width * 0.5,
                        child: Text(
                          widget.title,
                          style: Theme.of(context).textTheme.headline5,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                      Text(
                        widget.author,
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 2,
                        softWrap: true,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          if (widget.saveStatus) {
                            provider.removeBook(
                              widget.id,
                              widget.userID,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Book Removed'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          } else {
                            provider.addBook(
                              widget.userID,
                              widget.id,
                              widget.title,
                              widget.author,
                              widget.imgUrl,
                              widget.viewUrl,
                              widget.downloadUrl,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Book Saved'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          }
                          booksProvider.changeStatus(widget.id);
                        },
                        icon: !widget.saveStatus
                            ? const Icon(Icons.bookmark_outline)
                            : const Icon(Icons.bookmark),
                        label: const SingleChildScrollView(
                            child: Text(
                          '     Save    ',
                          style: TextStyle(fontSize: 20),
                        )),
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(
                            const Color(0xFFFFFFFF),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xFF904A38),
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            PdfViewScreen.routename,
                            arguments: PdfViewScreenArguments(
                              name: widget.title,
                              url: widget.viewUrl,
                            ),
                          );
                        },
                        icon: const Icon(Icons.visibility),
                        label: const SingleChildScrollView(
                            child: Text(
                          '     View    ',
                          style: TextStyle(fontSize: 20),
                        )),
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(
                            const Color(0xFFFFFFFF),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xFF904A38),
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          launch(widget.downloadUrl);
                        },
                        icon: const Icon(Icons.download_for_offline),
                        label: const SingleChildScrollView(
                          child: Text(
                            'Download',
                            style: TextStyle(fontSize: 19),
                          ),
                        ),
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(
                            const Color(0xFFFFFFFF),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xFF904A38),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
