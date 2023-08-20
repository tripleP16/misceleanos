import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/presentation/providers/permissions/permissions_provider.dart';
import 'package:second_app/presentation/screens/screens.dart';

class CompassScreen extends ConsumerWidget {
  const CompassScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final locationGranted = ref.watch(permissionsProvider).locationGranted;

    if (!locationGranted) {
      return const AskLocationScreen();
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Brujula',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Center(child: Compass()),
    );
  }
}

class Compass extends StatelessWidget {
  const Compass({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('155', 
          style: TextStyle(
            color: Colors.white,
            fontSize: 30
          )
        ),
        const SizedBox(height: 10,),
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/compass/quadrant-1.png'),
            Image.asset('assets/images/compass/needle-2.png')
          ],
        )
      ],
    );
  }
}