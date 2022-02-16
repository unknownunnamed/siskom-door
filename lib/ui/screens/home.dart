import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.neutralWhite,
      body: Container(
        margin: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const Center(child: Text("Halaman Home\nSiskom Door", textAlign: TextAlign.center,),),),
    );
  }
}