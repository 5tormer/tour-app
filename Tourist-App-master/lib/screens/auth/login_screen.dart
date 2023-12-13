import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_app/screens/auth/widgets/custom_button_widget.dart';
import 'package:tourist_app/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool visibility = true;

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
        child: Column(
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
              obscureText: visibility,
              controller: passwordController,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onLongPressUp: () {
                    setState(() {
                      visibility = !visibility;
                    });
                  },
                  onLongPressDown: (details) {
                    setState(() {
                      visibility = !visibility;
                    });
                  },
                  child: visibility
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
                var _result = await context.read<AuthService>().signIn(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );

                _result
                    ? Navigator.pushNamedAndRemoveUntil(
                        context, '/main', (route) => false)
                    : null;
              },
              childText: 'Войти',
            ),
          ],
        ),
      ),
    );
  }
}
