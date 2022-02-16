import 'package:flutter/material.dart';
// import 'package:sisdoor/ui/screens/home.dart';
import 'package:sisdoor/ui/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Siskom Door',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Poppins",
      ),
      home: const Login(),
    );
  }
}
