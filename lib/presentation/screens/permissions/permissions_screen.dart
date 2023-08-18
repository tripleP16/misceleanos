import 'package:flutter/material.dart';

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


class _PermissionsView extends StatelessWidget {
  const _PermissionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [

        CheckboxListTile(
            value: true,
            title: const Text('Camara'),
            subtitle: const Text('Estado Actual'),
            onChanged: (value) {
            }
        )
      ],
    );
  }
}
