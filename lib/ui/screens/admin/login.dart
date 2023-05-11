import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/constants/routes.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__button.dart';
import '../../../widgets/widget_default/__textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade800,
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.admin_panel_settings, size: 100, color: Colors.blueGrey),
              const SizedBox(height: 20),
              MyTextField(
                  controller: _username,
                  constraints: const BoxConstraints.tightForFinite(width: 300),
                  isPasswordCompatible: true,
                  prefixIcon: const Icon(Icons.person),
                  hint: 'username'),
              MyTextField(
                  controller: _password,
                  constraints: const BoxConstraints.tightForFinite(width: 300),
                  prefixIcon: const Icon(Icons.lock),
                  isPasswordCompatible: true,
                  hint: 'password'),
              MyButton(action: () => Navigator.pushNamed(context, MyRoutes.admin), width: 300, height: 40, label: 'Sign in'),
            ],
          ),
        ),
      ),
    );
  }
}
