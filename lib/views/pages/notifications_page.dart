import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    String title = 'Notificações';

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
        child: Text("Página de Notificações"),
      ),
      // ValueListenableBuilder(
      //   valueListenable: selectedPageNotifier,
      //   builder: (context, selectedPage, child) {
      //     return pages.elementAt(selectedPage);
      //   },
    );
  }
}
