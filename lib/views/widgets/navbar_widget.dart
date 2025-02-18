import 'package:flutter/material.dart';
import 'package:mentor_hub_mobile/data/notifiers.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBar(
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Feed',
            ),
            NavigationDestination(
              icon: Icon(Icons.people),
              label: 'Conexões',
            ),
            NavigationDestination(icon: Icon(Icons.room), label: 'Salas'),
            NavigationDestination(
              icon: Icon(Icons.message),
              label: 'Mensagens',
            ),
            NavigationDestination(
              icon: Icon(Icons.menu),
              label: 'Menu',
            ),
          ],
          elevation: 8.0,
          selectedIndex: selectedPage,
          onDestinationSelected: (value) {
            selectedPageNotifier.value = value;
          },
        );
      },
    );
  }
}
