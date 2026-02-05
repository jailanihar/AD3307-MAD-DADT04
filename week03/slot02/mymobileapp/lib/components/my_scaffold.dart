import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  final String title;
  final Widget body;

  const MyScaffold({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
            color: Colors.grey[700],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        // padding: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 20.0,
        ),
        child: Column(
          children: [
            if(Navigator.canPop(context))
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back),
            ),
            body,
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.amber[100],
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              onTap:() {
                Navigator.of(context).pushNamed('/login');
              }
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap:() {
                Navigator.of(context).pushNamed('/dashboard');
              }
            ),
          ]
        ),
      ),
    );
  }
}