// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen(
    this.password, {
    super.key,
  });

  final String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Password: $password'),
      ),
    );
  }
}
