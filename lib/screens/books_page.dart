import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewBooks extends StatefulWidget {

  @override
  _ViewBooksState createState() => _ViewBooksState();
}

class _ViewBooksState extends State<ViewBooks> {
  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Container(
              height: height* 0.2,
              width: width,
              child: BookHeader(),
            ),
            Subject(),
            SizedBox(height: 25),
            Container(
              height: height* 0.6,
              child: ListView(
                children: [
                  Books(),
                  Books(),
                  Books(),
                  Books(),
                  Books(),
                  Books(),
                ],
              ),
            )
          ],
        )
    );
  }
}

class BookHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            child: Image(image: AssetImage('assets/images/bookTopLeft.png'),),
          ),
          top: 0, left: 0,
        ),
        Positioned(
          child: Container(
            child: Image(image: AssetImage('assets/images/bookTopRight.png'),),
          ),
          top: 0, right: 0,
        ),
      ],
    );
  }
}

class Subject extends StatefulWidget {

  @override
  _SubjectState createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('MA2101', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),),
        Text('ENGG MATHS', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 35.0),),
      ],
    );
  }
}

class Books extends StatefulWidget {

  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> {
  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(left: 20, top: 30, right: 20),
      child: Container(
        height: height* 0.3,
        width: width,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ConstrainedBox(constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.6,
                  maxHeight: MediaQuery.of(context).size.width * 0.6,
                ),
                  child: Image.asset(
                    'assets/images/bookCover.png', fit: BoxFit.fill,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Column(
                    children: [
                      Text('Becoming',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30
                        ),
                      ),
                      Text('Michelle Obama',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.bookmark),
                        label: Text('     Save     '),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color(0xFF904A38))
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.visibility),
                        label: Text('     View     '),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color(0xFF904A38))
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.download_for_offline),
                        label: Text('Download'),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color(0xFF904A38))
                        ),
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
