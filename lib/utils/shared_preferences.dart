import 'package:get_storage/get_storage.dart';

class SharedPref {
  final prefs = GetStorage();

  void setSessionData({
    required String token,
  }) {
    prefs.write('token', token);
  }

  void isFirstTime(bool value) {
    prefs.write('isFirstTime', value);
  }

  void setDarkMode(bool isDark) {
    prefs.write('isDark', isDark);
  }

  void removeSessionData() {
    prefs.remove('token');
  }

  String get getToken {
    return prefs.read('token') ?? '';
  }

  bool get getIsFirstTime {
    return prefs.read('isFirstTime') ?? true;
  }

  bool get getIsDark {
    return prefs.read('isDark') ?? false;
  }
}
