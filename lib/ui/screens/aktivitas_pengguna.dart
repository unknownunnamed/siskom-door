import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/services/log_services.dart';
import 'package:sisdoor/ui/widgets/custom_appbar.dart';
import 'package:sisdoor/ui/widgets/custom_aktivitas_card.dart';

class AktivitasPengguna extends StatefulWidget {
  const AktivitasPengguna({Key? key}) : super(key: key);

  @override
  State<AktivitasPengguna> createState() => _AktivitasPenggunaState();
}

class _AktivitasPenggunaState extends State<AktivitasPengguna> {
  Iterable<DataSnapshot> data = [];

  void initData() async {
    LogServices.ref.onValue.listen((event) {
      setState(() {
        data = event.snapshot.children;
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
                  bottom: (MediaQuery.of(context).size.width / 3) / 4,
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
                      'AKTIVITAS PENGGUNA',
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
              height: MediaQuery.of(context).size.height - 105 - 85,
              child: ListView(
                padding: EdgeInsets.fromLTRB(30, 10, 26, 10),
                children: data
                    .map((e) => CustomAktivitasCard(
                          datetime: DateFormat('d MMM yyyy \nHH:mm').format(
                              DateTime.fromMillisecondsSinceEpoch(int.parse(e
                                          .child("timestamp")
                                          .value
                                          .toString()) *
                                      1000)
                                  .subtract(Duration(hours: 7))),
                          idkartu: e.child('nomor_kartu').value.toString(),
                          ruangan:
                              e.child('ruangan').value.toString().toUpperCase(),
                          isLock:
                              e.child('status_kunci').value.toString() == "1"
                                  ? false
                                  : true,
                        ))
                    .toList(),
              ),
            )
          ])
        ]));
  }
}
