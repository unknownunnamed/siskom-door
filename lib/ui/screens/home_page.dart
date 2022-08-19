import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/services/firebase_auth.dart';
import 'package:sisdoor/services/pintu_services.dart';
import 'package:sisdoor/ui/screens/login.dart';
import 'package:sisdoor/ui/screens/schedule.dart';
import 'package:sisdoor/ui/widgets/custom_error_modal.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Iterable<DataSnapshot> data = [];

  void initData() async {
    PintuServices.ref.onValue.listen((event) {
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
                Positioned(
                    top: 33,
                    right: 13,
                    child: GestureDetector(
                      onTap: () async {
                        await AuthFirebase.signOut();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
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
                              color: NewCustomColor.thirdGreen,
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
                    50 -
                    85,
                padding: EdgeInsets.fromLTRB(0, 44, 0, 5),
                decoration: BoxDecoration(
                    color: NewCustomColor.bgGreen,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(60))),
                child: GridView(
                  padding: EdgeInsets.only(left: 14, right: 14),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisSpacing: MediaQuery.of(context).size.width / 30,
                    crossAxisSpacing: MediaQuery.of(context).size.width / 30,
                    childAspectRatio: 1 / 0.7,
                  ),
                  children: data
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
                                  color: NewCustomColor.firstGradientGreenColor,
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.only(top: 10, bottom: 9),
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
                                      MediaQuery.of(context).size.height / 8,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          try {
                                            await PintuServices.changeLock(
                                                e
                                                            .child('kunci')
                                                            .value
                                                            .toString() ==
                                                        '1'
                                                    ? 0
                                                    : 1,
                                                e.key.toString(),
                                                int.parse(e
                                                    .child('pagiJam')
                                                    .value
                                                    .toString()),
                                                int.parse(e
                                                    .child('soreJam')
                                                    .value
                                                    .toString()),
                                                int.parse(e
                                                    .child('pagiMenit')
                                                    .value
                                                    .toString()),
                                                int.parse(e
                                                    .child('soreMenit')
                                                    .value
                                                    .toString()));
                                          } catch (err) {
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext
                                                        context) =>
                                                    customErrorModal(
                                                        context,
                                                        err.toString() ==
                                                                'Sudah diluar jam operasional'
                                                            ? 'Sudah diluar jam operasional'
                                                            : 'Terjadi kesalahan'));
                                          }
                                        },
                                        child: Icon(
                                          e.child('kunci').value.toString() ==
                                                  '0'
                                              ? Icons.lock_outlined
                                              : Icons.lock_open_outlined,
                                          size: 33,
                                          color: e
                                                      .child('kunci')
                                                      .value
                                                      .toString() ==
                                                  '0'
                                              ? NewCustomColor
                                                  .firstGradientGreenColor
                                              : NewCustomColor.firstRed,
                                        ),
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
                                                    '0'
                                                ? Text(
                                                    'Pintu Terbuka',
                                                    style: TextStyle(
                                                        color: NewCustomColor
                                                            .firstGradientGreenColor,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  )
                                                : Text(
                                                    'Pintu Tertutup',
                                                    style: TextStyle(
                                                        color: NewCustomColor
                                                            .firstRed,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Schedule(
                                                              key_pintu: e.key
                                                                  .toString(),
                                                            )));
                                              },
                                              child: Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    4, 3, 4, 2),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    color: NewCustomColor
                                                        .jamOperasionalButton,
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.25),
                                                          offset: Offset(1, 1),
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
        ));
  }
}
