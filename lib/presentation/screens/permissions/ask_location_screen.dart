import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/presentation/providers/providers.dart';

class AskLocationScreen extends ConsumerWidget {
  const AskLocationScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permision Requerido'),
      ),
      body: Center(
          child: FilledButton(
        onPressed: () {
          ref.read(permissionsProvider.notifier).requestLocationAccess();
        },
        child: const Text('Localizacion necesaria'),
      )),
    );
  }
}
