import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mymobileapp/components/my_scaffold.dart';
import 'package:mymobileapp/components/my_textformfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passwordController =TextEditingController();
  final TextEditingController _fullNameController =TextEditingController();

  void _register() async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      User? user = credential.user;
      if(user != null) {
        DocumentReference userDoc = 
          FirebaseFirestore.instance.collection('users').doc(user.uid);

          userDoc.set({
            'full_name': _fullNameController.text,
          });
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: 'Register Page',
      body: Column(
        children: [
          MyTextFormField(
            labelText: 'Email',
            controller: _emailController,
          ),
          MyTextFormField(
            labelText: 'Password',
            controller: _passwordController,
          ),
          MyTextFormField(
            labelText: 'Full Name',
            controller: _fullNameController,
          ),
          ElevatedButton(
            onPressed: _register,
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }
}