import 'package:flutter/material.dart';
import 'package:mymobileapp/components/my_scaffold.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: 'Dashboard',
      body: const Text('Welcome to Dashboard'),
    );
  }
}