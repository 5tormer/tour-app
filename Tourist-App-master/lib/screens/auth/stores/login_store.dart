import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tourist_app/services/auth_service.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final _authService = AuthService();
  @observable
  bool visibility = true;

  @action
  void toggleVisibility() {
    visibility != visibility;
  }

  @action
  Future<void> login(
      BuildContext context, String email, String password) async {
    var _result = await _authService.signIn(
      email: email,
      password: password,
    );

    _result
        ? Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false)
        : null;
  }
}
