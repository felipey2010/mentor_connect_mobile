import 'package:flutter/material.dart';
import 'package:mentor_hub_mobile/views/widgets/theme_switch_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [ThemeSwitchWidget()],
        ),
        OutlinedButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.logout),
                SizedBox(width: 8.0),
                Text("Sair do aplicativo")
              ],
            ))
      ],
    ));
  }
}
