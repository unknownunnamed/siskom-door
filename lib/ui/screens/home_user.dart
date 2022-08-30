import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/services/firebase_auth.dart';
import 'package:sisdoor/services/pintu_services.dart';
import 'package:sisdoor/ui/screens/login.dart';
import 'package:sisdoor/ui/widgets/custom_jam_operasional_modal.dart';

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
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight,
                          colors: [
                        NewCustomColor.firstGradientBlueColor,
                        NewCustomColor.secondGradientBlueColor
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
                    Positioned(
                        top: 33,
                        right: 13,
                        child: GestureDetector(
                          onTap: () async {
                            await AuthFirebase.signOut();
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()),
                                (route) => false);
                          },
                          child: Container(
                              width: 41,
                              height: 41,
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Center(
                                child: Icon(
                                  Icons.logout_outlined,
                                  size: 20,
                                  color: NewCustomColor.thirdBlue,
                                ),
                              )),
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'SIKEPIN',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Sistem Monitoring dan Kendali Keamanan Pintu',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
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
                    padding: EdgeInsets.fromLTRB(0, 44, 0, 5),
                    decoration: BoxDecoration(
                        color: NewCustomColor.bgGreen,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(60))),
                    child: GridView(
                      padding: EdgeInsets.only(left: 14, right: 14, bottom: 20),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        mainAxisSpacing: MediaQuery.of(context).size.width / 30,
                        crossAxisSpacing:
                            MediaQuery.of(context).size.width / 30,
                        childAspectRatio: 1 / 0.7,
                      ),
                      children: dataKendali
                          .map((e) => Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: NewCustomColor.shadowCard
                                              .withOpacity(0.7),
                                          offset: Offset(1, 1),
                                          blurRadius: 4,
                                          spreadRadius: 0)
                                    ]),
                                child: Column(
                                  children: [
                                    Container(
                                      color: NewCustomColor.bgBlueCard,
                                      width: MediaQuery.of(context).size.width,
                                      padding:
                                          EdgeInsets.only(top: 10, bottom: 9),
                                      child: Center(
                                          child: Text(
                                        e.key.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 17,
                                            color: Colors.white),
                                      )),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.width /
                                                  3 -
                                              50,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            e.child('kunci').value.toString() ==
                                                    '1'
                                                ? Icons.lock_outlined
                                                : Icons.lock_open_outlined,
                                            size: 33,
                                            color: e
                                                        .child('kunci')
                                                        .value
                                                        .toString() ==
                                                    '1'
                                                ? NewCustomColor
                                                    .firstGradientGreenColor
                                                : NewCustomColor.firstRed,
                                          ),
                                          Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                e
                                                            .child('mSwitch')
                                                            .value
                                                            .toString() ==
                                                        '1'
                                                    ? Text(
                                                        'Pintu Terbuka',
                                                        style: TextStyle(
                                                            color: NewCustomColor
                                                                .firstGradientGreenColor,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      )
                                                    : Text(
                                                        'Pintu Tertutup',
                                                        style: TextStyle(
                                                            color:
                                                                NewCustomColor
                                                                    .firstRed,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                                context) =>
                                                            customJamOperasionalModal(
                                                                context,
                                                                "${e.child('pagiJam').value.toString().length > 1 ? e.child('pagiJam').value.toString() : '0' + e.child('pagiJam').value.toString()}.${e.child('pagiMenit').value.toString().length > 1 ? e.child('pagiMenit').value.toString() : '0' + e.child('pagiMenit').value.toString()}",
                                                                "${e.child('soreJam').value.toString().length > 1 ? e.child('soreJam').value.toString() : '0' + e.child('soreJam').value.toString()}.${e.child('soreMenit').value.toString().length > 1 ? e.child('soreMenit').value.toString() : '0' + e.child('soreMenit').value.toString()}"));
                                                  },
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            4, 3, 4, 2),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5)),
                                                        color: NewCustomColor
                                                            .jamOperasionalButton,
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.25),
                                                              offset:
                                                                  Offset(1, 1),
                                                              blurRadius: 3,
                                                              spreadRadius: 0)
                                                        ]),
                                                    child: Text(
                                                      "Jam Operasional",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: NewCustomColor
                                                              .jamOperasionalText),
                                                    ),
                                                  ),
                                                )
                                              ])
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                  )
                ])
              ],
            )));
  }
}
