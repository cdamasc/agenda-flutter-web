import 'package:flutter/material.dart';
import 'Pages/ServicosPage.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ServicosPage(),
      navigatorKey: navigatorKey, //Para utilizar metodos que estão em outra classe e precisao receber o Context
    );
  }
}
