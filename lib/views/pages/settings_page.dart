import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    String title = 'Configurações';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            color: const Color.fromARGB(40, 158, 158, 158),
            height: 1.0,
          ),
        ),
      ),
      body: Center(
        child: Text("Página de Configurações"),
      ),
      // ValueListenableBuilder(
      //   valueListenable: selectedPageNotifier,
      //   builder: (context, selectedPage, child) {
      //     return pages.elementAt(selectedPage);
      //   },
    );
  }
}
