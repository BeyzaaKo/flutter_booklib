// user_provider.dart
import 'package:flutter/foundation.dart';
import 'package:books_app/jsonModel/users.dart';

class UserProvider with ChangeNotifier {
  Users? _user;

  Users? get user => _user;

  void setUser(Users user) {
    _user = user;
    notifyListeners();
  }
}
