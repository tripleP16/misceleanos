import 'package:flutter/material.dart';

class MagnetometerScreen extends StatelessWidget {
  const MagnetometerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Magnetometro'),
      ),
      body: const Center(child: Text('Pantalla del magnetometro')),
    );
  }
}