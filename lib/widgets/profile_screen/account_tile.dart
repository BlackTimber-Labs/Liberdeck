import 'package:flutter/material.dart';

/// Widget to Display Account Information of the User
class AccountTile extends StatelessWidget {
  /// Constructor
  const AccountTile({
    Key? key,
    required this.title,
    required this.leading,
  }) : super(key: key);

  /// User Info
  final String title;

  /// Info Category
  final String leading;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        leading.toUpperCase(),
        style: const TextStyle(
          fontSize: 21.5,
          fontWeight: FontWeight.w500,
        ),
      ),
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.end,
        style: const TextStyle(
          fontSize: 21.5,
          fontWeight: FontWeight.w500,
          color: Color(0xFFC95A2B),
        ),
      ),
    );
  }
}
