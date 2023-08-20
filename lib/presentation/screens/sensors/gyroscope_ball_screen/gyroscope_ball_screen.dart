import 'package:flutter/material.dart';

class GyroscopeBallScreen extends StatelessWidget {
  const GyroscopeBallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giroscopio con contenedor redondeado'),
      ),
      body: const Center(child: Text('Pantalla del giroscopio con contenedor redondeado')),
    );
  }
}