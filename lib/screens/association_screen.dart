import 'package:flutter/material.dart';

class AssociationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Association'),
      ),
      body: Center(
        child: Text(
          'Informations sur l\'association',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
