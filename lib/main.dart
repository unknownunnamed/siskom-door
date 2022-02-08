import 'package:flutter/material.dart';
import 'package:sisdoor/ui/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Siskom Door',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Poppins",
      ),
      home: const Home(),
    );
  }
}
