import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tourist_app/services/auth_service.dart';
part 'main_store.g.dart';

class MainStore = _MainStoreBase with _$MainStore;

abstract class _MainStoreBase with Store {
  final _authService = AuthService();

  @action
  Future<void> signOut(BuildContext context) async {
    await _authService.signOut();
    _authService.currentUser == null
        ? Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false)
        : null;
  }
}
