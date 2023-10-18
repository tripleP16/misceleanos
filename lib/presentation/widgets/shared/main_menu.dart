import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final String route;

  MenuItem(this.title, this.icon, this.route);
}

final menuItems = <MenuItem>[
  MenuItem('Giroscopio', Icons.downloading, '/gyroscope'),
  MenuItem('Acelerometro', Icons.speed, '/acelerometer'),
  MenuItem('Magnetometro', Icons.explore_outlined, '/magnetometer'),
  MenuItem('Giroscopio Ball', Icons.sports_baseball, '/gyroscope-ball'),
  MenuItem('Brujula', Icons.explore, '/compass'),
  MenuItem('Pokemons', Icons.catching_pokemon, '/pokemons'),
  MenuItem('Biometricos', Icons.fingerprint, '/biometrics'),
  MenuItem('Ubicacion', Icons.pin_drop, '/location'),
  MenuItem('Mapas', Icons.maps_ugc_outlined, '/maps'),
  MenuItem('Controlado', Icons.gamepad_outlined, '/controlled-map'),
  MenuItem('Badge', Icons.notification_important_outlined, '/badge'),
  MenuItem('Anuncio Completo', Icons.fullscreen, '/ad-fullscreen'),
  MenuItem('Anuncio con recompensa', Icons.card_giftcard, '/ad-rewarded'),
];

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: menuItems
            .map((item) => _HomeMenuItem(
                title: item.title, route: item.route, icon: item.icon))
            .toList());
  }
}

class _HomeMenuItem extends StatelessWidget {
  final String title;
  final String route;
  final IconData icon;
  final List<Color> bgColors;

  const _HomeMenuItem(
      {required this.title,
      required this.route,
      required this.icon,
      // ignore: unused_element
      this.bgColors = const [Colors.blue, Colors.blueAccent]});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(route),
      child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  colors: bgColors,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 40,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white),
              )
            ],
          )),
    );
  }
}
