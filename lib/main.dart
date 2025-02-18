import 'package:flutter/material.dart';
import 'package:mentor_hub_mobile/data/my_theme.dart';
import 'package:mentor_hub_mobile/data/notifiers.dart';
import 'package:mentor_hub_mobile/views/widget_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDark, child) {
        return MaterialApp(
          title: 'MentorConnect',
          debugShowCheckedModeBanner: false,
          theme: isDark ? MyTheme.lightTheme : MyTheme.darkTheme,
          home: const WidgetTree(),
        );
      },
    );
  }
}
