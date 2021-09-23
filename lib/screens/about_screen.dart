import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';



class AboutScreen extends StatefulWidget {
  static const String routename = '/about_screen';
  @override
  _AboutScreenState createState() => _AboutScreenState();
}


class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children:<Widget> [
        Background(),
        const Padding(
          padding: EdgeInsets.only(left: 28),
          child: Text(
            'BEHIND THE \nSCENES',
            style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(
          height: 19,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 28),
          child: Text(
            'APP DEVELOPERS',
            style: TextStyle(fontSize: 24.5, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Harshita(),
        const SizedBox(
          height: 10,
        ),
        Tushar(),
        const SizedBox(
          height: 10,
        ),
        Yash(),
      ],
    ));
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 200,
            decoration:const BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/images/about_screen_top_left.png'),
                    alignment: Alignment.topLeft)),
          ),
        ),
        Expanded(
          child: Container(
            height: 200,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/images/about_screen_top_right.png'),
                    alignment: Alignment.topRight)),
          ),
        ),
      ],
    );
  }
}

class Harshita extends StatefulWidget {
  @override
  _HarshitaState createState() => _HarshitaState();
}

class _HarshitaState extends State<Harshita> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 100.0,
          backgroundImage:
              AssetImage('assets/images/about_screen_Harshita.png'),
        ),
        const SizedBox(
          height: 5,
        ),
        const Center(
            child: Text(
          'Harshita Sadadekar',
          style: TextStyle(fontSize: 21.5, fontWeight: FontWeight.w600),
        )),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.github),
              onPressed: () {
                launch('https://github.com/HarshitaSadadekar');
              },
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.linkedin),
              onPressed: () {
                launch(
                    'https://www.linkedin.com/in/harshita-sadadekar-94196b1b8/');
              },
            )
          ],
        )
      ],
    );
  }
}

class Tushar extends StatefulWidget {
  @override
  _TusharState createState() => _TusharState();
}

class _TusharState extends State<Tushar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 100.0,
          backgroundImage: AssetImage('assets/images/about_screen_Tushar.jpg'),
        ),
        const SizedBox(
          height: 5,
        ),
        const Center(
            child: Text(
          'Tushar Khurana',
          style: TextStyle(fontSize: 21.5, fontWeight: FontWeight.w600),
        )),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.github),
              onPressed: () {
                launch('https://github.com/Tusharkhurana70');
              },
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.linkedin),
              onPressed: () {
                launch('https://www.linkedin.com/in/tushar-khurana-6a282b130/');
              },
            )
          ],
        )
      ],
    );
  }
}

class Yash extends StatefulWidget {
  @override
  _YashState createState() => _YashState();
}

class _YashState extends State<Yash> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 100.0,
          backgroundImage: AssetImage('assets/images/about_screen_Yash.jpg'),
        ),
        const SizedBox(
          height: 5,
        ),
        const Center(
            child: Text(
          'Yash Garg',
          style: TextStyle(fontSize: 21.5, fontWeight: FontWeight.w600),
        )),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(FontAwesomeIcons.github),
              onPressed: () {
                launch('https://github.com/Megabyte-143');
              },
            ),
            IconButton(
              icon: const Icon(FontAwesomeIcons.linkedin),
              onPressed: () {
                launch('https://www.linkedin.com/in/yash-garg-megabyte');
              },
            )
          ],
        )
      ],
    );
  }
}
