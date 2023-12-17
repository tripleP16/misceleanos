import 'package:go_router/go_router.dart';
import 'package:second_app/presentation/screens/screens.dart';

final appRouter = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
  GoRoute(
      path: '/permissions',
      builder: (context, state) => const PermissionsScreen()),
  GoRoute(
      path: '/gyroscope', builder: (context, state) => const GyroscopeScreen()),
  GoRoute(
      path: '/acelerometer',
      builder: (context, state) => const AcelometerScreen()),
  GoRoute(
      path: '/magnetometer',
      builder: (context, state) => const MagnetometerScreen()),
  GoRoute(
      path: '/gyroscope-ball',
      builder: (context, state) => const GyroscopeBallScreen()),
  GoRoute(path: '/compass', builder: (context, state) => const CompassScreen()),

  //Pokemons

  GoRoute(
      path: '/pokemons',
      builder: (context, state) => const PokemonsScreen(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final id = state.pathParameters['id'] ?? '1';
            return PokemonScreen(
              pokemonId: id,
            );
          },
        )
      ]),
  GoRoute(
      path: '/biometrics',
      builder: (context, state) => const BiometricScreen()),

  GoRoute(
      path: '/location', builder: (context, state) => const LocationScreen()),

  GoRoute(path: '/maps', builder: (context, state) => const MapScreen()),

  GoRoute(
      path: '/controlled-map',
      builder: (context, state) => const ControlledMapScreen()),

  GoRoute(path: '/badge', builder: (context, state) => const BadgeScreen()),

  GoRoute(
      path: '/ad-fullscreen',
      builder: (context, state) => const AdFullScreen()),

  GoRoute(
      path: '/ad-rewarded',
      builder: (context, state) => const AdRewardedScreen()),

  GoRoute(
      path: '/db-pokemons',
      builder: (context, state) => const DbPokemonsScreen()),
]);
