import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/services/user_services.dart';
import 'package:sisdoor/ui/screens/tambah_pengguna.dart';
import 'package:sisdoor/ui/widgets/custom_appbar.dart';
import 'package:sisdoor/ui/widgets/custom_pengguna_card.dart';

class Pengguna extends StatefulWidget {
  const Pengguna({Key? key}) : super(key: key);

  @override
  State<Pengguna> createState() => _PenggunaState();
}

class _PenggunaState extends State<Pengguna> {
  Iterable<DataSnapshot> dataUser = [];

  void initData() async {
    UserServices.ref.orderByChild('status').equalTo(0).onValue.listen((event) {
      setState(() {
        dataUser = event.snapshot.children;
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
    return Scaffold(
        backgroundColor: CustomColor.neutralWhite,
        appBar: customAppbar(context, "Data Pengguna"),
        body: SizedBox(
            // padding: EdgeInsets.symmetric(horizontal: 30),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                ListView(
                  padding: EdgeInsets.only(top: 10, bottom: 70),
                  children: dataUser
                      .map((e) => CustomPenggunaCard(
                          dataUser: e,))
                      .toList(),
                ),
                Positioned(
                  bottom: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TambahPengguna()));
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
                          "Tambah Pengguna",
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
            )));
  }
}
