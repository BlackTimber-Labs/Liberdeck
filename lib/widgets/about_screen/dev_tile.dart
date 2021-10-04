import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

/// About Screen's Developer Tile Widget.
class DevTile extends StatelessWidget {
  /// Constructor of the class
  const DevTile({
    required this.name,
    required this.img,
    required this.gitUrl,
    required this.linkedInUrl,
  });

  /// Image of the Developer
  final String img;

  /// Name of the Developer
  final String name;

  /// URL to the GitHub Profile
  final String gitUrl;

  /// URL to the LinkedIn Profile
  final String linkedInUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 100.0,
            backgroundImage: AssetImage(img),
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 21.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(FontAwesomeIcons.github),
                onPressed: () {
                  launch(gitUrl);
                },
              ),
              IconButton(
                icon: const Icon(FontAwesomeIcons.linkedin),
                onPressed: () {
                  launch(linkedInUrl);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
