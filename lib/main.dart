import 'package:bschool/screens/home_screen.dart';
import 'package:bschool/screens/physique_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BschoolApp());
}

class BschoolApp extends StatelessWidget {
  const BschoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bschool UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily:
            'Poppins', // Using a custom font is recommended for a polished look
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/physique': (context) => const PhysiqueScreen(),
      },
    );
  }
}
