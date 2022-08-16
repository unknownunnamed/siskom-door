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
            // padding: EdgeInsets.symmetric(horizontal: 30),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 85,
            child: ListView(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              children: data
                  .map((e) => CustomAktivitasCard(
                        datetime: DateFormat('d MMM yyyy \nHH:mm').format(
                            DateTime.fromMillisecondsSinceEpoch(int.parse(
                                        e.child("timestamp").value.toString()) *
                                    1000)
                                .subtract(Duration(hours: 7))),
                        idkartu: e.child('nomor_kartu').value.toString(),
                        ruangan: e.child('ruangan').value.toString().toUpperCase(),
                        isLock: e.child('status_kunci').value.toString() == "1"
                            ? false
                            : true,
                      ))
                  .toList(),
            ));
  }
}
