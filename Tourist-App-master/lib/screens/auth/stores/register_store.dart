import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tourist_app/services/auth_service.dart';
part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  final _authService = AuthService();
  @observable
  bool visibility = true;

  @action
  void toggleVisibility() {
    visibility != visibility;
  }

  @action
  Future<void> register(
      BuildContext context, String email, String password) async {
    var _result = await _authService.signUp(
      email: email,
      password: password,
    );

    _result
        ? Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false)
        : null;
  }
}
