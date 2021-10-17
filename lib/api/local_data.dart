import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  late SharedPreferences data ;
  void user() async {
    final prefs = await SharedPreferences.getInstance().then((value) {
      data = value;
    });
  }
}
