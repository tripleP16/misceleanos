import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/presentation/providers/providers.dart';

class AcelometerScreen extends ConsumerWidget {
  const AcelometerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final userAccelometer$ = ref.watch(accelometerUserProvider);
    final gravityAccelometer$ = ref.watch(accelometerGravityProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Acelerometro'),
        ),
        body: Column(
          children: [
            const Text('Acelerometro con gravedad'),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: gravityAccelometer$.when(
              data: (value) => Text(value.toString()),
              error: (error, stackTrace) => Text('$error'),
              loading: () => const CircularProgressIndicator.adaptive())
            ),
            const SizedBox(height: 30,),
            const Text('Acelerometro sin gravedad'),
             const SizedBox(
              height: 30,
            ),
            Center(
              child: userAccelometer$.when(
              data: (value) => Text(value.toString()),
              error: (error, stackTrace) => Text('$error'),
              loading: () => const CircularProgressIndicator.adaptive())
            ),
          ],
        ));
  }
}
