import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:tourist_app/screens/auth/login_screen.dart';
import 'package:tourist_app/screens/auth/register_screen.dart';
import 'package:tourist_app/screens/main/main_screen.dart';
import 'package:tourist_app/screens/profle/profile_screen.dart';
import 'package:tourist_app/services/auth_service.dart';
import 'package:tourist_app/theme/stores/theme_store.dart';
import 'package:tourist_app/theme/theme_repository.dart';
import 'package:tourist_app/theme/theme_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User?>(
          create: (context) => AuthService().authStateChanges,
          initialData: null,
        ),
        Provider<ThemeStore>(
          create: (_) =>
              ThemeStore(ThemeService(ThemeRepository()))..getTheme(),
        ),
      ],
      child: Consumer<ThemeStore>(
        builder: (_, ThemeStore value, __) => Observer(
          builder: (_) => MaterialApp(
            theme: value.theme,
            routes: {
              '/': (context) => const RegisterScreen(),
              '/login': (context) => const LoginScreen(),
              '/profile': (context) => const ProfileScreen(),
              '/main': (context) => const MainScreen(),
            },
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }
}
