import 'package:second_app/infraestructure/infraestructure.dart';
import 'package:workmanager/workmanager.dart';

const fetchBackgroundTaskKey = 'com.example.secondApp.fetch-background-pokemon';
const fetchPeriodicBackgroundTaskKey =
    'com.example.secondApp.fetch-peridodic-background-pokemon';

@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case fetchBackgroundTaskKey:
        await loadNextPokemon();
        break;
      case fetchPeriodicBackgroundTaskKey:
        await loadNextPokemon();
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

Future loadNextPokemon() async {
  final localDbRepository = LocalDbRepositoryImpl();
  final pokemonRepository = PokemonsRepositoryImpl(PokemonsDatasourceImpl());
  final lastPokemonId = await localDbRepository.pokemonCount() + 1;

  try {
    final (pokemon, message) =
        await pokemonRepository.getPokemon(lastPokemonId.toString());
    if (pokemon == null) throw message;
    await localDbRepository.insertPokemon(pokemon);
    print('Pokemon inserted');
  } catch (e) {
    print(e);
  }
}
