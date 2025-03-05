import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/user_data_service.dart';

class UserProvider with ChangeNotifier {
  final UserDataService _service = UserDataService();
  User? _user;

  User get user =>
      _user ??
      User(
        displayName: 'noname',
        language: 'English',
        avatarPath: 'none',
      );

  bool get isInitialized => _user != null;

  Future<void> initialize() async {
    await _service.init();
    _user = _service.loadUserData();
    notifyListeners();
  }

  void updateDisplayName(String displayName) {
    if (_user != null) {
      _user = _user!.copyWith(displayName: displayName);
      _service.saveUserData(_user!);
      notifyListeners();
    }
  }

  void updateLanguage(String language) {
    if (_user != null) {
      _user = _user!.copyWith(language: language);
      _service.saveUserData(_user!);
      notifyListeners();
    }
  }

  void updateAvatar(String avatarPath) {
    if (_user != null) {
      _user = _user!.copyWith(avatarPath: avatarPath);
      _service.saveUserData(_user!);
      notifyListeners();
    }
  }
}
