import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mymobileapp/components/my_scaffold.dart';
import 'package:mymobileapp/components/my_textformfield.dart';
import 'package:mymobileapp/l10n/app_localizations.dart';

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
      title: AppLocalizations.of(context)!.loginTitle,
      body: Column(
        children: [
          Image.asset(
            'assets/images/pb_logo.png',
            width: 150,
            height: 150,
          ),
          Text(AppLocalizations.of(context)!.welcomeLogin),
          MyTextFormField(
            labelText: AppLocalizations.of(context)!.email,
            controller: usernameController,
          ),
          MyTextFormField(
            labelText: AppLocalizations.of(context)!.password,
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
              Text(AppLocalizations.of(context)!.showPasswordSwitch),
            ],
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                UserCredential user =
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: usernameController.text,
                    password: passwordController.text,
                  );
                // setState(() {
                //   _errorMessage = 'Able to login';
                // });
                if(mounted) {
                  // Navigator.of(context).pushNamed('/dashboard');
                  // Navigator.of(context).pushReplacementNamed('/dashboard');
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/dashboard',
                    (Route<dynamic> route) => false,
                  );
                }
              } on FirebaseAuthException catch (e) {
                print(e.toString());
                setState(() {
                  _errorMessage = 'Error login in';
                });
              }
            },
            child: Text(AppLocalizations.of(context)!.loginButton),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/register');
            },
            child: Text(AppLocalizations.of(context)!.registerAccountButton),
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