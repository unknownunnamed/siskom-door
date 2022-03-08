import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/ui/widgets/custom_appbar.dart';

class Pengguna extends StatelessWidget {
  const Pengguna({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.neutralWhite,
        appBar: customAppbar(context, "Data Pengguna"),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView()));
  }
}
