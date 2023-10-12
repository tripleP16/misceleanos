import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:second_app/presentation/providers/providers.dart';

class ControlledMapScreen extends ConsumerWidget {
  const ControlledMapScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final watchUserLocation = ref.watch(watchLocationProvider);
    final userInitialLocation = ref.watch(userLocationProvider);

    return Scaffold(
      body: userInitialLocation.when(
          data: (data) => MapAndControls(latitude: data.$1, longitude: data.$2),
          error: (error, _) => Text('$error'),
          loading: () => const Center(
                child: Text('Ubicando usuario'),
              )),
    );
  }
}

class MapAndControls extends ConsumerWidget {
  final double latitude;
  final double longitude;

  const MapAndControls(
      {super.key, required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context, ref) {
    final mapControllerState = ref.watch(mapControllerProvider);
    return Stack(
      children: [
        _MapView(initialLatitude: latitude, initialLongitude: longitude),
        Positioned(
          top: 40,
          left: 20,
          child: IconButton.filledTonal(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        Positioned(
          bottom: 40,
          left: 20,
          child: IconButton.filledTonal(
              onPressed: () {
                ref.read(mapControllerProvider.notifier).findUser();
              },
              icon: const Icon(Icons.location_searching)),
        ),
        Positioned(
          bottom: 90,
          left: 20,
          child: IconButton.filledTonal(
              onPressed: () {
                ref.read(mapControllerProvider.notifier).toggleFollowUser();
              },
              icon: Icon(mapControllerState.followingUser
                  ? Icons.directions_run
                  : Icons.accessibility_new_outlined)),
        ),
        Positioned(
          bottom: 140,
          left: 20,
          child: IconButton.filledTonal(
              onPressed: () {
                ref
                    .read(mapControllerProvider.notifier)
                    .addMarkerCurrentPosition();
              },
              icon: const Icon(Icons.pin_drop)),
        )
      ],
    );
  }
}

class _MapView extends ConsumerStatefulWidget {
  final double initialLatitude;
  final double initialLongitude;
  const _MapView(
      {required this.initialLatitude, required this.initialLongitude});

  @override
  __MapViewState createState() => __MapViewState();
}

class __MapViewState extends ConsumerState<_MapView> {
  @override
  Widget build(BuildContext context) {
    final mapController = ref.watch(mapControllerProvider);
    return GoogleMap(
      markers: mapController.markersSet,
      mapType: MapType.normal,
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      initialCameraPosition: CameraPosition(
          target: LatLng(widget.initialLatitude, widget.initialLongitude),
          zoom: 12),
      onMapCreated: (GoogleMapController controller) {
        ref.read(mapControllerProvider.notifier).setMapController(controller);
      },
      onLongPress: (argument) {
        ref.read(mapControllerProvider.notifier).addMarker(argument.latitude,
            argument.longitude, 'El usuario creo este marcador');
      },
    );
  }
}
