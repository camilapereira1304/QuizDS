import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Importe a tela de splash

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuizDS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Defina a tela de splash como inicial
    );
  }
}
