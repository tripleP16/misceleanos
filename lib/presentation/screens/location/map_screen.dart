import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:second_app/presentation/providers/providers.dart';

class MapScreen extends ConsumerWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final currentPosition$ = ref.watch(userLocationProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('MapScreen'),
      ),
      body: currentPosition$.when(
          data: (data) =>
              _MapView(initialLatitude: data.$1, initialLongitude: data.$2),
          error: (error, _) => Text('$error'),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}

class _MapView extends StatefulWidget {
  final double initialLatitude;
  final double initialLongitude;
  const _MapView(
      {required this.initialLatitude, required this.initialLongitude});

  @override
  State<_MapView> createState() => __MapViewState();
}

class __MapViewState extends State<_MapView> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.hybrid,
      initialCameraPosition: CameraPosition(
          target: LatLng(widget.initialLatitude, widget.initialLongitude),
          zoom: 12),
      onMapCreated: (GoogleMapController controller) {},
    );
  }
}
