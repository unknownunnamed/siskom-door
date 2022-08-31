import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/services/pintu_services.dart';
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
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height / (5 / 2) - 85,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.centerRight,
                    colors: [
                  NewCustomColor.firstGradientGreenColor,
                  NewCustomColor.secondGradientGreenColor
                ])),
            child: Stack(children: [
              Positioned(
                  top: -(MediaQuery.of(context).size.width / 1.84) / 3,
                  right: -(MediaQuery.of(context).size.width / 1.84) / 6,
                  child: Container(
                    height: MediaQuery.of(context).size.width / 1.84,
                    width: MediaQuery.of(context).size.width / 1.84,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.15)),
                  )),
              Positioned(
                  bottom: -(MediaQuery.of(context).size.width / 3) / 4,
                  right: -(MediaQuery.of(context).size.width / 3) / 2.5,
                  child: Container(
                    height: MediaQuery.of(context).size.width / 3,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.15)),
                  )),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 13, right: 13, top: 51),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 28,
                      width: 28,
                      padding: EdgeInsets.only(left: 7),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      ),
                    ),
                    Text(
                      'DATA RUANGAN',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 19),
                    ),
                    Container(
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
          Column(children: [
            SizedBox(
              height: 105,
            ),
            Container(
                decoration: BoxDecoration(
                    color: NewCustomColor.bgGreen,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(60))),
                padding: EdgeInsets.only(top: 41),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 105 - 85-
                          MediaQuery.of(context).viewInsets.bottom,
                child: Stack(
                  children: [
                    ListView(
                      padding: EdgeInsets.only(top: 10, bottom: 60),
                      children: dataPintu
                          .map((e) => CustomDoorCard(dataPintu: e))
                          .toList(),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  customTambahPintulModal(context));
                        },
                        child: Container(
                            width: 56,
                            height: 56,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            decoration: BoxDecoration(
                                color: NewCustomColor.bgGreenButton,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      offset: Offset(2, 2),
                                      blurRadius: 4,
                                      spreadRadius: 0)
                                ]),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                size: 40,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    )
                  ],
                ))
          ])
        ]));
  }
}
