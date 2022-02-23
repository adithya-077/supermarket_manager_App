import 'package:flutter/cupertino.dart';
import 'package:flutter_application_instagram_clone/models/user_models.dart';
import 'package:flutter_application_instagram_clone/resources/auth_method.dart';

class UserdataProvider with ChangeNotifier {
  UserDataModels _user = UserDataModels(
      userName: 'userName',
      dpName: 'dpName',
      email: 'email',
      followers: [],
      following: [],
      dpno: 0,
      userUid: 'userUid',
      bio: 'bio',
      mbno: 'mbno');

  UserDataModels get getUser => _user;

  final AuthMethod _authMethod = AuthMethod();

  Future<void> refreshUserdata() async {
    UserDataModels user = await _authMethod.getUserinformation();

    _user = user;
    notifyListeners();
  }
}
