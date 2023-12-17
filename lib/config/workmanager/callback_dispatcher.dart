import 'package:workmanager/workmanager.dart';

const fetchBackgroundTaskKey = 'com.example.secondApp.fetch-background-pokemon';
const fetchPeriodicBackgroundTaskKey =
    'com.example.secondApp.fetch-peridodic-background-pokemon';

@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    switch (task) {
      case fetchBackgroundTaskKey:
        print('fetchBackgroundTaskKey');
        break;
      case fetchPeriodicBackgroundTaskKey:
        print('fetchPeriodicBackgroundTaskKey');
        break;

      case Workmanager.iOSBackgroundTask:
        print('iOSBackgroundTask');
        break;
      default:
        print('Default');
    }
    return Future.value(true);
  });
}
