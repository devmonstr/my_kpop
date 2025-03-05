import 'package:my_kpop/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataService {
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  User loadUserData() {
    return User(
      displayName: _prefs.getString('displayname') ?? 'noname',
      language: _prefs.getString('language') ?? 'English',
      avatarPath: _prefs.getString('avatar') ?? 'none',
    );
  }

  Future<void> saveUserData(User user) async {
    await Future.wait([
      _prefs.setString('displayname', user.displayName),
      _prefs.setString('language', user.language),
      _prefs.setString('avatar', user.avatarPath),
    ]);
  }
}
