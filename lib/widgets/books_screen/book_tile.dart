import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  });
  String id;
  String title;
  String author;
  String imgUrl;
  String viewUrl;
  String downloadUrl;
  bool saveStatus;
}

class _BookTileState extends State<BookTile> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final SavedBooksProvider provider =
        Provider.of<SavedBooksProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.02,
        horizontal: width * 0.03,
      ),
      height: height * 0.35,
      width: width,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.6,
                  maxHeight: MediaQuery.of(context).size.width * 0.6,
                ),
                child: Image.network(
                  widget.imgUrl,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.03, left: width * 0.02),
                child: Column(
                  children: [
                    Text(
                      widget.title,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      widget.author,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (widget.saveStatus) {
                          provider.removeBook(widget.id);
                        } else {
                          provider.addBook(
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
                      onPressed: () {},
                      icon: const Icon(Icons.visibility),
                      label: const Text('     View     '),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF904A38))),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.download_for_offline),
                      label: const Text('Download'),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF904A38))),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
