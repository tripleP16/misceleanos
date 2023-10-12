// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState {
  final bool isReady;
  final bool followingUser;
  final List<Marker> markers;
  final GoogleMapController? controller;

  MapState(
      {this.isReady = false,
      this.followingUser = false,
      this.markers = const [],
      this.controller});

  Set<Marker> get markersSet {
    return Set.from(markers);
  }

  MapState copyWith({
    bool? isReady,
    bool? followingUser,
    List<Marker>? markers,
    GoogleMapController? controller,
  }) {
    return MapState(
      isReady: isReady ?? this.isReady,
      followingUser: followingUser ?? this.followingUser,
      markers: markers ?? this.markers,
      controller: controller ?? this.controller,
    );
  }
}

class MapNotifier extends StateNotifier<MapState> {
  MapNotifier() : super(MapState()) {
    trackUser().listen((event) {
      lastKnownLocation = (event.$1, event.$2);
    });
  }
  StreamSubscription? userLocation$;
  (double, double)? lastKnownLocation;

  Stream<(double, double)> trackUser() async* {
    await for (final pos in Geolocator.getPositionStream()) {
      yield (pos.latitude, pos.longitude);
    }
  }

  void setMapController(GoogleMapController controller) {
    state = state.copyWith(controller: controller, isReady: true);
  }

  void goToLocation(double latitude, double longitude) {
    final newPosition =
        CameraPosition(target: LatLng(latitude, longitude), zoom: 20);

    state.controller
        ?.animateCamera(CameraUpdate.newCameraPosition(newPosition));
  }

  toggleFollowUser() {
    state = state.copyWith(followingUser: !state.followingUser);

    if (state.followingUser) {
      findUser();
      userLocation$ = trackUser().listen((event) {
        goToLocation(event.$1, event.$2);
      });
    } else {
      userLocation$?.cancel();
    }
  }

  findUser() {
    if (lastKnownLocation == null) return;
    goToLocation(lastKnownLocation!.$1, lastKnownLocation!.$2);
  }

  void addMarker(double latitude, double longitude, String? name) {
    final newMarker = Marker(
        markerId: MarkerId('${state.markers.length}'),
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(
            title: name ?? '', snippet: 'Esto es el snippet del info window'));

    state = state.copyWith(markers: [...state.markers, newMarker]);
  }

  void addMarkerCurrentPosition() {
    if (lastKnownLocation == null) return;
    addMarker(lastKnownLocation!.$1, lastKnownLocation!.$2,
        'Ultima posicion del usuario');
  }
}

final mapControllerProvider =
    StateNotifierProvider<MapNotifier, MapState>((ref) {
  return MapNotifier();
});
