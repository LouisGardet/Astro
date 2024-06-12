import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres de compte'),
      ),
      body: Center(
        child: Text(
          'Paramètres de compte',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
