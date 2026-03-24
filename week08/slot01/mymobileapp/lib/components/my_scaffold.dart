import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mymobileapp/l10n/app_localizations.dart';
import 'package:mymobileapp/providers/locale_provider.dart';
import 'package:provider/provider.dart';

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
    final localeProvider = Provider.of<LocaleProvider>(context);
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
        actions: [
          DropdownButton<Locale>(
            items: AppLocalizations.supportedLocales.map(
              (locale) => DropdownMenuItem<Locale>(
                value: locale,
                child: Text(locale.languageCode.toUpperCase()),
              ),
            ).toList(),
            onChanged: (Locale? locale) {
              if(locale != null) {
                localeProvider.setLocale(locale);
              }
            },
          ),
        ]
      ),
      body: Padding(
        // padding: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 20.0,
        ),
        child: ListView(
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
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap:() async {
                try {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/login',
                    (Route<dynamic> route) => false,
                  );
                } catch (e) {

                }
              }
            ),
          ]
        ),
      ),
    );
  }
}