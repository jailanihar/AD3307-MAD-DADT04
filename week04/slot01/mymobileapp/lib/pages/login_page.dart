import 'package:flutter/material.dart';
import 'package:mymobileapp/components/my_scaffold.dart';
import 'package:mymobileapp/components/my_textformfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController =
    TextEditingController();
  final TextEditingController passwordController =
    TextEditingController();

  String _errorMessage = '';
  bool _showPassword = false;

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
          MyTextFormField(
            labelText: 'Username',
            controller: usernameController,
          ),
          MyTextFormField(
            labelText: 'Password',
            controller: passwordController,
            obscureText: !_showPassword,
          ),
          Row(
            children: [
              Switch(
                value: _showPassword,
                onChanged: (value) {
                  setState(() {
                    _showPassword = value;
                  });
                },
              ),
              const Text('Show Password'),
            ],
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