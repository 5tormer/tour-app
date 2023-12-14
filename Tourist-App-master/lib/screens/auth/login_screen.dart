import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tourist_app/screens/auth/stores/login_store.dart';
import 'package:tourist_app/screens/auth/widgets/custom_button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final _loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Войти',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Observer(
          builder: (context) => Column(
            children: [
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  labelText: "Введите почту",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                obscureText: _loginStore.visibility,
                controller: passwordController,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onLongPressUp: () {
                      _loginStore.toggleVisibility();
                    },
                    onLongPressDown: (details) {
                      _loginStore.toggleVisibility();
                    },
                    child: _loginStore.visibility
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  labelText: 'Введите пароль',
                ),
              ),
              CustomButtonWidget(
                onPressed: () async {
                  await _loginStore.login(context, emailController.text.trim(),
                      passwordController.text.trim());
                },
                childText: 'Войти',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
