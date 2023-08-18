import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/presentation/providers/providers.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permissions Screen'),
      ),
      body: const _PermissionsView(),
    );
  }
}

class _PermissionsView extends ConsumerWidget {
  const _PermissionsView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    
    return ListView(
      children: [
        CheckboxListTile(
            value: true,
            title: const Text('Camara'),
            subtitle: const Text('Estado Actual'),
            onChanged: (value) {}),
       
      ],
    );
  }
}
