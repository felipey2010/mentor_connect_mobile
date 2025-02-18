import 'package:flutter/material.dart';

class LoadingAppState extends StatelessWidget {
  const LoadingAppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Mentor Connect",
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: CircularProgressIndicator(),
        ));
  }
}
