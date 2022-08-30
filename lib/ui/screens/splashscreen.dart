import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/services/user_services.dart';
import 'package:sisdoor/ui/screens/home_admin.dart';
import 'package:sisdoor/ui/screens/home_user.dart';
import 'package:sisdoor/ui/screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user != null) {
        UserServices.ref.child(user.uid).onValue.listen((event) {
          if (event.snapshot.child('status').value.toString() == '1') {
            Timer(
                Duration(seconds: 3),
                () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeAdmin()),
                    (route) => false));
          } else {
            Timer(
                Duration(seconds: 3),
                () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeUser()),
                    (route) => false));
          }
        });
      } else {
        Timer(
            Duration(seconds: 3),
            () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Login()),
                (route) => false));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.neutralWhite,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: CustomColor.neutralWhite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/images/logo.png"),
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
