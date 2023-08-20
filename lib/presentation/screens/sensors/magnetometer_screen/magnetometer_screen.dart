import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/presentation/providers/providers.dart';

class MagnetometerScreen extends ConsumerWidget {
  const MagnetometerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final mangnetometer$ = ref.watch(magnetometerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Magnetometro'),
      ),
      body: Center(
        child: mangnetometer$.when(
          data: (value) => Text(
            value.toString()
          ), 
          error: (error, stackTrace) => Text('$error'), 
          loading: () => const CircularProgressIndicator.adaptive()
        )
      ),
    );
  }
}
