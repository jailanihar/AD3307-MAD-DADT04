import 'package:flutter/material.dart';
import 'package:mymobileapp/components/my_scaffold.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController =
    TextEditingController();
  final TextEditingController passwordController =
    TextEditingController();

  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: 'Login',
      body: Column(
        children: [
          Image.asset(
            'assets/images/pb_logo.png',
            width: 150,
            height: 150,
          ),
          const Text('Welcome to Login'),
          TextFormField(
            controller: usernameController,
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () {
              if(usernameController.text == 'antah' &&
                  passwordController.text == 'berantah'
              ) {
                Navigator.of(context).pushNamed('/dashboard');
              } else {
                setState(() {
                  _errorMessage = 'Invalid credentials';
                });
              }
            },
            child: const Text('Login'),
          ),
          Text(
            _errorMessage,
            style: const TextStyle(
              color: Colors.red,
            ),
          ),
        ]
      ),
    );
  }
}