import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/presentation/providers/providers.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permissions Screen'),
      ),
      body: const _PermissionsView(),
    );
  }
}

class _PermissionsView extends ConsumerWidget {
  const _PermissionsView();

  @override
  Widget build(BuildContext context, ref) {
    final permissions = ref.watch(permissionsProvider);

    return ListView(
      children: [
        CheckboxListTile(
            value: permissions.cameraGranted,
            title: const Text('Camara'),
            subtitle: Text('${permissions.camera}'),
            onChanged: (_) {
              ref.read(permissionsProvider.notifier).requestCameraAccess();
        }),

         CheckboxListTile(
            value: permissions.photoLibraryGranted,
            title: const Text('Galeria'),
            subtitle: Text('${permissions.photoLibrary}'),
            onChanged: (_) {
              ref.read(permissionsProvider.notifier).requestPhotoLibraryAccess();
        }),

         CheckboxListTile(
            value: permissions.sensorsGranted,
            title: const Text('Sensores'),
            subtitle: Text('${permissions.sensors}'),
            onChanged: (_) {
              ref.read(permissionsProvider.notifier).requestSensorsAccess();
        }),

         CheckboxListTile(
            value: permissions.locationGranted,
            title: const Text('Localizacion'),
            subtitle: Text('${permissions.location}'),
            onChanged: (_) {
              ref.read(permissionsProvider.notifier).requestLocationAccess();
        }),

         CheckboxListTile(
            value: permissions.locationAlwaysGranted,
            title: const Text('Localizacion Siempre Activa'),
            subtitle: Text('${permissions.locationAlways}'),
            onChanged: (_) {
              ref.read(permissionsProvider.notifier).requestLocationAlways();
        }),

         CheckboxListTile(
            value: permissions.locationWhenInUseGranted,
            title: const Text('Localizacion solamente app en uso'),
            subtitle: Text('${permissions.locationWhenInUse}'),
            onChanged: (_) {
              ref.read(permissionsProvider.notifier).requestLocationWhenInUse();
        }),

          CheckboxListTile(
            value: permissions.locationWhenInUseGranted,
            title: const Text('Localizacion solamente app en uso'),
            subtitle: Text('${permissions.locationWhenInUse}'),
            onChanged: (_) {
              ref.read(permissionsProvider.notifier).requestLocationWhenInUse();
            }),
      ],
    );
  }
}
