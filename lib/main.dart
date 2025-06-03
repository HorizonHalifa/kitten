import 'package:flutter/material.dart';
import 'package:kitten/view/kitten_view.dart';

// Entry point for the app
void main() {
  runApp(const KittenApp());
}

/// Root widget that wraps the application.
class KittenApp extends StatelessWidget {
  const KittenApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kitten',
      theme: ThemeData(scaffoldBackgroundColor: Color(0xfff8d7dd)),
      // theme: ThemeData(
      //   scaffoldBackgroundColor: const Color(0x00f8d7dd), // Pastel Pink
      // ),
      home: const KittenScreen(), // Loads the kitten UI
      debugShowCheckedModeBanner: false, // Remove DEBUG banner from corner
    );
  }
}
