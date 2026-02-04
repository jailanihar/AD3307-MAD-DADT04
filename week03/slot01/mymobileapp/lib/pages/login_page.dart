import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
            color: Colors.brown,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        // padding: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 10.0,
        ),
        child: Column(
          children: [
            const Text('Welcome'),
            TextFormField(),
            TextFormField(),
          ],
        ),
      ),
    );
  }
}

class LoginPageStateful extends StatefulWidget {
  const LoginPageStateful({super.key});

  @override
  State<LoginPageStateful> createState() =>
    _LoginPageStatefulState();
}

class _LoginPageStatefulState 
    extends State<LoginPageStateful> {
  
  final TextEditingController usernameController = TextEditingController();
  String _username = '';
  
  final List<String> _welcomeMessages = [
    'Welcome',
    'Selamat Datang',
    'Marhaba',
    'Welkommen',
  ];
  int _currentWelcomeIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
            color: Colors.brown,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        // padding: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 10.0,
        ),
        child: Column(
          children: [
            // Text(_welcomeMessages[_currentWelcomeIndex]),
            Text('${_welcomeMessages[_currentWelcomeIndex]}, $_username'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // _currentWelcomeIndex++;
                  _currentWelcomeIndex =
                    (_currentWelcomeIndex + 1) %
                    _welcomeMessages.length;
                });
              },
              child: const Text('Change Welcome Message'),
            ),
            TextFormField(
              controller: usernameController,
              onChanged: (value) {
                setState(() {
                  _username = value;
                });
              },
            ),
            TextFormField(),
          ],
        ),
      ),
    );
  }
}