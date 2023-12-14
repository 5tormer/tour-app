import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:tourist_app/theme/theme_service.dart';
part 'theme_store.g.dart';

// class ThemeStore = _ThemeStoreBase with _$ThemeStore;

class ThemeStore extends _ThemeStoreBase with _$ThemeStore {
  ThemeStore(ThemeService themeService) : super(themeService);
}

abstract class _ThemeStoreBase with Store {
  _ThemeStoreBase(this._themeService);

  final ThemeService _themeService;

  @computed
  bool get isDark => theme.brightness == Brightness.dark;

  @observable
  late ThemeData theme;

  @action
  Future<void> getTheme() async {
    theme = _themeService.lightTheme;
    theme = await _themeService.getTheme();
  }

  @action
  Future<void> toggleTheme() async {
    theme = await _themeService.toggleTheme(theme);
  }
}
