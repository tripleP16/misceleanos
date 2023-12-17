import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_app/config/plugins/shared_preferences_plugin.dart';
import 'package:second_app/config/workmanager/callback_dispatcher.dart';
import 'package:workmanager/workmanager.dart';

class BackgroundFetchNotifier extends StateNotifier<bool?> {
  final String processKeyName;

  BackgroundFetchNotifier({required this.processKeyName}) : super(false) {
    checkCurrentStatus();
  }

  checkCurrentStatus() async {
    state = await SharedPreferencesPlugin.getBool(processKeyName);
  }

  toggleProcess() async {
    if (state == true) {
      await deactivateProcess();
    } else {
      await activateProcess();
    }
  }

  activateProcess() async {
    await Workmanager().registerPeriodicTask(
      processKeyName,
      processKeyName,
      frequency: const Duration(minutes: 15),
      initialDelay: const Duration(seconds: 10),
      constraints: Constraints(
        networkType: NetworkType.connected,
      ),
      tag: processKeyName,
    );

    await SharedPreferencesPlugin.setBool(processKeyName, true);
    state = true;
  }

  deactivateProcess() async {
    await Workmanager().cancelByTag(processKeyName);
    await SharedPreferencesPlugin.setBool(processKeyName, false);
    state = false;
  }
}

final backgroundPokemonFetchProvider =
    StateNotifierProvider<BackgroundFetchNotifier, bool?>(
  (ref) =>
      BackgroundFetchNotifier(processKeyName: fetchPeriodicBackgroundTaskKey),
);
