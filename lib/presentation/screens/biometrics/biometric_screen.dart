import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/presentation/providers/providers.dart';

class BiometricScreen extends ConsumerWidget {
  const BiometricScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final canCheckBiometrics = ref.watch(canCheckBiometricsProvider);

    final localAuthState = ref.watch(localAuthProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Biometric Screen'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FilledButton.tonal(
              onPressed: () {
                ref.read(localAuthProvider.notifier).authenticateUser();
              },
              child: const Text('Autenticar')),
          canCheckBiometrics.when(
              data: (canCheck) => Text('Puede revisar biometricos: $canCheck'),
              error: (error, _) => Text('Error: $error'),
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  )),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Estado del biometrico',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            'Estado $localAuthState',
            style: const TextStyle(fontSize: 20),
          ),
        ]),
      ),
    );
  }
}
