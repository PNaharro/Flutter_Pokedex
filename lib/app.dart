import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/layouts/MainLayout.dart';

// Main application widget
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  AppState createState() => AppState();
}

// Main application state
class AppState extends State<App> {
  // Definir el contenido del widget 'App'
  @override
  Widget build(BuildContext context) {
    // Utilizamos la base 'Cupertino'
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: const CupertinoThemeData(brightness: Brightness.light),
      home: const MainLayout(),
      routes: {
        '/intro': (context) => const MainLayout(),
        //'/settings': (context) => const LayoutSettings(),
        //'/play': (context) => const LayoutPlay(),
      },
    );
  }
}
