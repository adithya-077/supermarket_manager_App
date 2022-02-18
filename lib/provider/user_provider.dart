import 'package:flutter/cupertino.dart';
import 'package:flutter_application_instagram_clone/models/user_models.dart';
import 'package:flutter_application_instagram_clone/resources/auth_method.dart';

class UserdataProvider with ChangeNotifier {
  UserDataModels? _user;

  UserDataModels get getUser => _user!;

  final AuthMethod _authMethod = AuthMethod();

  Future<void> refreshUserdata() async {
    UserDataModels user = await _authMethod.getUserinformation();

    _user = user;
    print('REFREDED USERS');
    notifyListeners();
  }
}
