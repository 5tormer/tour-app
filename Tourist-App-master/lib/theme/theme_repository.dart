/// lib/domain/theme/interfaces/i_theme_repository.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourist_app/consts/keys.dart';

abstract class IThemeRepository {
  Future<String> getThemeKey();
  Future<void> setThemeKey(Brightness brightness);
}

class ThemeRepository implements IThemeRepository {
  @override
  Future<void> setThemeKey(Brightness brightness) async {
    (await SharedPreferences.getInstance()).setString(
      Keys.theme,
      brightness == Brightness.light ? "light" : "dark",
    );
  }

  @override
  Future<String> getThemeKey() async {
    return (await SharedPreferences.getInstance()).getString(Keys.theme) ??
        "light";
  }
}
