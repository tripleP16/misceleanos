import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';

class AccelometerXYZ {
  final double x;
  final double y;
  final double z;

  AccelometerXYZ(this.x, this.y, this.z);

  @override
  String toString() {
    return ''' 
        x:$x,
        y:$y,
        z:$z
     ''';
  }
}

final accelometerUserProvider = StreamProvider.autoDispose<AccelometerXYZ>((ref) async* {
  await for (final event in userAccelerometerEvents) {
    yield AccelometerXYZ(event.x, event.y, event.z);
  }
});

final accelometerGravityProvider = StreamProvider.autoDispose<AccelometerXYZ>((ref) async* {
  await for (final event in accelerometerEvents) {
    yield AccelometerXYZ(event.x, event.y, event.z);
  }
});
