import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__button.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__toast.dart';
import '../../../widgets/widget_default/__textfield.dart';
import 'auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoadingComplete = false;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    setState(() => isLoadingComplete = true);
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
                  isPasswordCompatible: false,
                  prefixIcon: const Icon(Icons.person),
                  hint: 'username'),
              MyTextField(
                  controller: _password,
                  constraints: const BoxConstraints.tightForFinite(width: 300),
                  prefixIcon: const Icon(Icons.lock),
                  isPasswordCompatible: true,
                  hint: 'password'),
              MyButton(
                  action: () async {
                    setState(() => isLoadingComplete = false);
                    final isLoggedIn = await auth(_username.text.trim(), _password.text.trim());
                    setState(() => isLoadingComplete = true);
                    debugPrint('loGIN : $isLoggedIn');
                    if (isLoggedIn) Get.toNamed('/admin');
                    if (!isLoggedIn) myToast('Wrong Cradentials!');
                  },
                  isLoadingComplete: isLoadingComplete,
                  width: 300,
                  height: 40,
                  label: 'Sign in'),
            ],
          ),
        ),
      ),
    );
  }
}
