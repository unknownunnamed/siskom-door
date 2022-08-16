import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/services/pintu_services.dart';
import 'package:sisdoor/ui/widgets/custom_appbar.dart';
import 'package:sisdoor/ui/widgets/custom_door_card.dart';
import 'package:sisdoor/ui/widgets/custom_tambah_pintu_modal.dart';

class Door extends StatefulWidget {
  const Door({Key? key}) : super(key: key);

  @override
  State<Door> createState() => _DoorState();
}

class _DoorState extends State<Door> {
  Iterable<DataSnapshot> dataPintu = [];
  void initData() async {
    PintuServices.ref.onValue.listen((event) {
      setState(() {
        dataPintu = event.snapshot.children;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 85,
            child: Stack(
              children: [
                ListView(
                  padding: EdgeInsets.only(top: 10, bottom: 70),
                  children: dataPintu
                      .map((e) => CustomDoorCard(dataPintu: e))
                      .toList(),
                ),
                Positioned(
                  bottom: 10,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              customTambahPintulModal(context));
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width - 60,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                            color: CustomColor.secondaryGreen,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        child: Text(
                          "Tambah Ruangan",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: CustomColor.neutralWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  ),
                )
              ],
            ));
  }
}
