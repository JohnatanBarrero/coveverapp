import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _instance = Preferences._internal();

  //Esto es el singleton
  factory Preferences() {
    return _instance;
  }
  Preferences._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // User get userState {
  //   final userTem = _prefs.getString('user');

  //   if (userTem != null) {
  //     final userJson = json.decode(userTem);
  //     final user = User.fromJson(userJson);
  //     return user;
  //   }

  //   return User();
  // }

  // set userState(User user) {
  //   final userTem = json.encode(user.toJson());
  //   _prefs.setString('user', userTem);
  // }

  bool get isdark {
    return _prefs.getBool('isdark') ?? false;
  }

  set isdark(bool value) {
    _prefs.setBool('isdark', value);
  }
}
