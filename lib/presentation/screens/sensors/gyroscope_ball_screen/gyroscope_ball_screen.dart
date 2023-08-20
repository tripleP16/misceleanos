import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/presentation/providers/providers.dart';

class GyroscopeBallScreen extends ConsumerWidget {
  const GyroscopeBallScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final gyroscope$ = ref.watch(gyroscopeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giroscopio con contenedor redondeado'),
      ),
      body: SizedBox.expand(
        child: gyroscope$.when(
            data: (value) => _MovingBall(x: value.x, y: value.y),
            error: (error, stackTrace) => Text('$error'),
            loading: () => const CircularProgressIndicator()),
      ),
    );
  }
}

class _MovingBall extends StatelessWidget {
  final double x;
  final double y;

  const _MovingBall({required this.x, required this.y});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double screenWidth = size.width;
    double screenHeight = size.height;

    double currentYPos = (y * 300);
    double currentXPos = (x * 300);


    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
            left: (currentYPos - 25) + (screenWidth / 2),
            top: (currentXPos - 25 ) + (screenHeight  / 2),
            curve: Curves.easeInOut,
            duration: const Duration(seconds: 1),
            child: _Ball()),
        Text(
          ''' 
        X:$x  
        Y:$y
        ''',
          style: const TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}

class _Ball extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(100)),
    );
  }
}
