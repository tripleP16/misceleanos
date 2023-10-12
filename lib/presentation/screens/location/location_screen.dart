import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/presentation/providers/providers.dart';

class LocationScreen extends ConsumerWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final userLocationAsync = ref.watch(userLocationProvider);
    final watchLocationAsync = ref.watch(watchLocationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubicacion'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Ubicacion Actual"),
          userLocationAsync.when(
              data: (data) => Text('$data'),
              error: (error, _) => Text('$error'),
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  )),
          const SizedBox(
            height: 30,
          ),
          const Text("Seguir movimiento de ubicacion"),
          watchLocationAsync.when(
              data: (data) => Text('$data'),
              error: (error, _) => Text('$error'),
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  )),
        ]),
      ),
    );
  }
}
