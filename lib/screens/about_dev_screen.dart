import 'package:flutter/material.dart';

import '../widgets/about_screen/dev_tile.dart';
import '../widgets/text_header.dart';

/// Root widget of the About Screen
class AboutDevScreen extends StatefulWidget {
  /// Route name of the About Screen
  static const String routename = '/about_screen';
  @override
  _AboutDevScreenState createState() => _AboutDevScreenState();
}

class _AboutDevScreenState extends State<AboutDevScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: height * 0.3,
              width: width,
              child: TextHeader(
                width: width,
                height: height,
                topRight: 'assets/images/about_screen_top_right.png',
                topLeft: 'assets/images/about_screen_top_left.png',
                title: 'MEET THE TEAM',
                subTitle: 'BLACKTIMBER LABS',
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'UI/UX Designer',
              style: Theme.of(context).textTheme.button,
            ),
            const DevTile(
              name: 'Chhavi Maheshwari',
              img: 'assets/images/about_screen_Chhavi.jpeg',
              gitUrl: 'https://github.com/chhavi30m',
              linkedInUrl:
                  'https://www.linkedin.com/in/chhavi-maheshwari-2841201b9',
            ),
            const SizedBox(height: 30),
            Text(
              'App developers',
              style: Theme.of(context).textTheme.button,
            ),
            const DevTile(
              name: 'Harshita Sadadekar',
              img: 'assets/images/about_screen_Harshita.jpeg',
              gitUrl: 'https://github.com/HarshitaSadadekar',
              linkedInUrl:
                  'https://www.linkedin.com/in/harshita-sadadekar-94196b1b8/',
            ),
            const DevTile(
              name: 'Tushar Khurana',
              img: 'assets/images/about_screen_Tushar.jpg',
              gitUrl: 'https://github.com/Tusharkhurana70',
              linkedInUrl:
                  'https://www.linkedin.com/in/tushar-khurana-6a282b130/',
            ),
            const DevTile(
              name: 'Yash Garg',
              img: 'assets/images/about_screen_Yash.jpg',
              gitUrl: 'https://github.com/Megabyte-143',
              linkedInUrl: 'https://www.linkedin.com/in/yash-garg-megabyte',
            ),
            const SizedBox(height: 30),
            Text(
              'Core Members',
              style: Theme.of(context).textTheme.button,
            ),
            const DevTile(
              name: 'Yash Arora',
              img: 'assets/images/about_screen_YashArora.jpg',
              gitUrl: 'https://github.com/yashar1908',
              linkedInUrl: 'https://www.linkedin.com/in/yash-arora-2763a81b9/',
            ),
            const DevTile(
              name: 'Mahi Badaya',
              img: 'assets/images/about_screen_Mahi.jpg',
              gitUrl: 'https://github.com/Mahi-Badaya',
              linkedInUrl: 'https://www.linkedin.com/in/mahibadaya/',
            ),
          ],
        ),
      ),
    );
  }
}
