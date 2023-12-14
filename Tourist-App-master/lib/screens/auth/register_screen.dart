import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tourist_app/screens/auth/login_screen.dart';
import 'package:tourist_app/screens/auth/stores/register_store.dart';
import 'package:tourist_app/screens/auth/widgets/custom_button_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _registerStore = RegisterStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Регистрация',
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
                obscureText: _registerStore.visibility,
                controller: passwordController,
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onLongPressUp: () {
                        _registerStore.toggleVisibility;
                      },
                      onLongPressDown: (details) {
                        _registerStore.toggleVisibility;
                      },
                      child: _registerStore.visibility
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    labelText: 'Введите пароль'),
              ),
              CustomButtonWidget(
                onPressed: () async {
                  await _registerStore.register(
                    context,
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );
                },
                childText: "Зарегистрироваться",
              ),
              const SizedBox(
                height: 2,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                ),
                child: const Text('Уже есть аккаунт? Войти'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
