import 'package:flutter/material.dart';

class CompassScreen extends StatelessWidget {
  const CompassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brujula'),
      ),
      body: const Center(child: Text('Pantalla de la brujula')),
    );
  }
}