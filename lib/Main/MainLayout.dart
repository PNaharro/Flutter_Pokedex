import 'package:flutter/material.dart';

import '../Pokemon/primeraGenForm.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  MainLayoutIntroState createState() => MainLayoutIntroState();
}

class MainLayoutIntroState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrimeraGen()),
                );
              },
              child: Text(
                'Pulsa para abrir',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: constraints.maxWidth *
                      0.1, // Ajuste dinámico del tamaño del texto
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
