import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/presentation/providers/providers.dart';
import 'package:second_app/presentation/screens/screens.dart';

class CompassScreen extends ConsumerWidget {
  const CompassScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final locationGranted = ref.watch(permissionsProvider).locationGranted;

    if (!locationGranted) {
      return const AskLocationScreen();
    }

    final compassHeading$ = ref.watch(compassProvider);

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
      body: Center(
          child: compassHeading$.when(
              data: (value) => Compass(heading: value ?? 0),
              error: (error, stackTrace) => Text(
                    '$error',
                    style: const TextStyle(color: Colors.white),
                  ),
              loading: () => const CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ))),
    );
  }
}

class Compass extends StatefulWidget {
  final double heading;
  const Compass({super.key, required this.heading});

  @override
  State<Compass> createState() => _CompassState();
}

class _CompassState extends State<Compass> {
    double prevValue = 0.0;
  double turns = 0;

  double getTurns() {

    double? direction = widget.heading;
    direction = (direction < 0) ? (360 + direction): direction;

    double diff = direction - prevValue;
    if(diff.abs() > 180) {

      if(prevValue > direction) {
        diff = 360 - (direction-prevValue).abs();
      } else {
        diff = 360 - (prevValue-direction).abs();
        diff = diff * -1;
      }
    }

    turns += (diff / 360);
    prevValue = direction;

    return turns * -1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Text(widget.heading.toStringAsFixed(2),
        //     style: const TextStyle(color: Colors.white, fontSize: 30)),
        const SizedBox(
          height: 10,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/compass/quadrant-1.png'),
            // Transform.rotate(
            //     angle: (heading * (pi / 180) * -1),
            //     child: ),

            AnimatedRotation(
              turns: getTurns(), 
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: Image.asset('assets/images/compass/needle-2.png'),
            )
          ],
        )
      ],
    );
  }
}
