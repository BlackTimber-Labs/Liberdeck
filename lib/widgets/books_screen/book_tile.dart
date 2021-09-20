import 'package:flutter/material.dart';
import 'package:liberdeck/provider/saved_book_provider.dart';
import 'package:provider/provider.dart';

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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<SavedBooksProvider>(context);

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        top: 30,
        right: 20,
      ),
      child: Container(
        height: height * 0.4,
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
                  child: Image.asset(
                    widget.imgUrl,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Column(
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      Text(
                        widget.author,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                        ),
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
                            ? Icon(Icons.bookmark_outline)
                            : Icon(Icons.bookmark),
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
      ),
    );
  }
}
