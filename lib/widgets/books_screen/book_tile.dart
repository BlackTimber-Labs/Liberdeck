import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../provider/saved_book_provider.dart';

class BookTile extends StatefulWidget {
  @override
  _BookTileState createState() => _BookTileState();
  BookTile({
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
    this.bookID = '',
  });
  String userID;
  String bookID;
  String id;
  String title;
  String author;
  String imgUrl;
  String viewUrl;
  String downloadUrl;
  bool saveStatus;
  double height;
  double width;
}

class _BookTileState extends State<BookTile> {
  @override
  Widget build(BuildContext context) {
    final double height = widget.height;
    final double width = widget.width;
    final SavedBooksProvider provider =
        Provider.of<SavedBooksProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.02,
        horizontal: width * 0.03,
      ),
      height: height * 0.4,
      color: Colors.amber,
      width: width,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: width * 0.5,
                  maxHeight: height * 0.35,
                ),
                child: Image.network(
                  widget.imgUrl,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.02,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
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
                        softWrap: true,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          if (widget.saveStatus) {
                            provider.removeBook(
                              widget.id,
                              widget.userID,
                              widget.bookID,
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
                          }
                          setState(() {
                            widget.saveStatus = !widget.saveStatus;
                          });
                        },
                        icon: !widget.saveStatus
                            ? const Icon(Icons.bookmark_outline)
                            : const Icon(Icons.bookmark),
                        label: const Text('     Save     '),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFF904A38))),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          SfPdfViewer.network(widget.viewUrl);
                        },
                        icon: const Icon(Icons.visibility),
                        label: const Text('     View     '),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFF904A38))),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          launch(widget.downloadUrl);
                        },
                        icon: const Icon(Icons.download_for_offline),
                        label: const Text('Download'),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xFF904A38))),
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
