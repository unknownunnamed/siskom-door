import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/ui/widgets/custom_appbar.dart';
import 'package:sisdoor/ui/widgets/custom_monitoring_card.dart';
import 'package:sisdoor/ui/widgets/custom_pengguna_card.dart';

class Pengguna extends StatelessWidget {
  const Pengguna({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.neutralWhite,
        appBar: customAppbar(context, "Data Pengguna"),
        body: Container(
            // padding: EdgeInsets.symmetric(horizontal: 30),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                ListView(
                  padding: EdgeInsets.only(top: 10, bottom: 70),
                  children: [1, 1, 1, 1, 1, 11, 1, 1, 1, 11, 1, 1, 1]
                      .map((e) => CustomPenggunaCard(
                          nama: "Tengku Nopriyanti Murti",
                          email: "Tengkunopri@gmail.com"))
                      .toList(),
                ),
                Positioned(
                  bottom: 10,
                  child: Container(
                      width: MediaQuery.of(context).size.width - 60,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                          color: CustomColor.secondaryGreen,
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: Text(
                        "Tambah Pengguna",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: CustomColor.neutralWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                )
              ],
            )));
  }
}
