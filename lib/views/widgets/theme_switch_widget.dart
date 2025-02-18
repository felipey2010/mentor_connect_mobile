import 'package:flutter/material.dart';
import 'package:mentor_hub_mobile/data/notifiers.dart';

class ThemeSwitchWidget extends StatelessWidget {
  const ThemeSwitchWidget({super.key});

  static const WidgetStateProperty<Icon> thumbIcon =
      WidgetStateProperty<Icon>.fromMap(
    <WidgetStatesConstraint, Icon>{
      WidgetState.selected: Icon(Icons.dark_mode),
      WidgetState.any: Icon(Icons.light_mode),
    },
  );

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, value, child) {
        return ListTile(
          leading: Icon(Icons.contrast),
          title: Text("Aparência"),
          subtitle: Text("Escolher o tema do aplicativo"),
          dense: true,
          trailing: Switch(
            activeColor: Theme.of(context).colorScheme.secondaryContainer,
            activeTrackColor: const Color.fromARGB(255, 235, 233, 233),
            inactiveThumbColor: Theme.of(context).colorScheme.primary,
            inactiveTrackColor: Colors.black,
            thumbIcon: thumbIcon,
            value: isDarkModeNotifier.value,
            onChanged: (value) {
              isDarkModeNotifier.value = value;
            },
          ),
        );
      },
    );
  }
}
