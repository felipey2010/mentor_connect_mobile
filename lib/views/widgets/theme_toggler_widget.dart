import 'package:flutter/material.dart';
import 'package:mentor_hub_mobile/data/notifiers.dart';

class ThemeToggler extends StatelessWidget {
  const ThemeToggler({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          isDarkModeNotifier.value = !isDarkModeNotifier.value;
        },
        style: OutlinedButton.styleFrom(
            side: BorderSide(color: Color.fromARGB(50, 158, 158, 158)),
            shape: CircleBorder()),
        child: ValueListenableBuilder(
          valueListenable: isDarkModeNotifier,
          builder: (context, isDark, child) {
            return Icon(
              isDark ? Icons.dark_mode : Icons.light_mode,
            );
          },
        ));
  }
}
