import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/services/firebase_auth.dart';
import 'package:sisdoor/services/pintu_services.dart';
import 'package:sisdoor/ui/screens/login.dart';
import 'package:sisdoor/ui/widgets/custom_user_card.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({Key? key}) : super(key: key);

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  Iterable<DataSnapshot> dataKendali = [];

  void initData() async {
    PintuServices.ref.onValue.listen((event) {
      setState(() {
        dataKendali = event.snapshot.children;
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
        backgroundColor: CustomColor.neutralLightGray,
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / (5 / 2),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              CustomColor.neutralBlack.withOpacity(0.5),
                              BlendMode.srcOver),
                          image: AssetImage("assets/images/bg_apk.png"),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                    right: 25,
                    top: 45,
                    child: GestureDetector(
                      onTap: () async {
                        await AuthFirebase.signOut();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                            (route) => false);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomColor.neutralLightGray),
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.logout_outlined,
                          color: CustomColor.primaryRose,
                          size: 20,
                        ),
                      ),
                    )),
                Column(children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / (5 / 2) - 50,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).viewInsets.bottom -
                        MediaQuery.of(context).size.height / (5 / 2) +
                        50,
                    padding: EdgeInsets.fromLTRB(20, 25, 20, 5),
                    decoration: BoxDecoration(
                        color: CustomColor.neutralWhite,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(60))),
                    child: ListView(
                      children: dataKendali
                          .map((e) => CustomUserCard(
                                ruangan: e.key.toString(),
                                isOpen:
                                    e.child('mSwitch').value.toString() == '1'
                                        ? true
                                        : false,
                                isLock: e.child('kunci').value.toString() == '0'
                                    ? true
                                    : false,
                                open:
                                    "${e.child('pagiJam').value.toString()}:${e.child('pagiMenit').value.toString()}",
                                close:
                                    "${e.child('soreJam').value.toString()}:${e.child('soreMenit').value.toString()}",
                              ))
                          .toList(),
                    ),
                  )
                ])
              ],
            )));
  }
}
