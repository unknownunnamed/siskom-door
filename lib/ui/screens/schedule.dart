import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/services/pintu_services.dart';

class Schedule extends StatefulWidget {
  final String key_pintu;
  const Schedule({Key? key, required this.key_pintu}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  bool isProsesClose = false;
  bool isProsesOpen = false;

  List<String> hour = [
    for (var i = 0; i <= 23; i += 1) i < 10 ? '0$i' : i.toString()
  ];

  List<String> minutes = [
    for (var i = 0; i < 60; i += 1) i < 10 ? '0$i' : i.toString()
  ];

  String? jamOpen, menitOpen, jamClose, menitClose;

  DataSnapshot? dataPintu;

  void initData() async {
    PintuServices.ref.child(widget.key_pintu).onValue.listen((event) {
      setState(() {
        dataPintu = event.snapshot;
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
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 28,
                          width: 28,
                          padding: EdgeInsets.only(left: 7),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(
                              child: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: NewCustomColor.firstGradientGreenColor,
                          )),
                        ),
                      ),
                      Spacer(),
                      Text(
                        'ATUR JADWAL OPERASIONAL',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 19),
                      ),
                      Spacer(),
                    ],
                  ),
                )
              ]),
            ),
            Column(
              children: [
                SizedBox(
                  height: 105,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: NewCustomColor.bgGreen,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(60))),
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 105,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          margin: EdgeInsets.only(bottom: 31),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    offset: Offset(4, 4),
                                    blurRadius: 10,
                                    spreadRadius: 0)
                              ]),
                          child: Center(
                            child: Text(
                              'Jam Operasional : ${dataPintu!.child('pagiJam').value.toString().length > 1 ? dataPintu!.child('pagiJam').value.toString() : '0' + dataPintu!.child('pagiJam').value.toString()}.${dataPintu!.child('pagiMenit').value.toString().length > 1 ? dataPintu!.child('pagiMenit').value.toString() : '0' + dataPintu!.child('pagiMenit').value.toString()} - ${dataPintu!.child('soreJam').value.toString().length > 1 ? dataPintu!.child('soreJam').value.toString() : '0' + dataPintu!.child('soreJam').value.toString()}.${dataPintu!.child('soreMenit').value.toString().length > 1 ? dataPintu!.child('soreMenit').value.toString() : '0' + dataPintu!.child('soreMenit').value.toString()}',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: NewCustomColor.primarygray),
                            ),
                          )),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(bottom: 31),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: NewCustomColor.bgCard,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ]),
                        child: Stack(
                          children: [
                            Positioned(
                                bottom:
                                    -(MediaQuery.of(context).size.width / 1.5) /
                                        2.7,
                                left:
                                    -(MediaQuery.of(context).size.width / 1.5) /
                                        4,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width / 1.5,
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: NewCustomColor.firstGreenCard),
                                )),
                            Positioned(
                                bottom:
                                    -(MediaQuery.of(context).size.width / 2.6) /
                                        2.3,
                                left: (MediaQuery.of(context).size.width / 5),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width / 2.6,
                                  width:
                                      MediaQuery.of(context).size.width / 2.6,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: NewCustomColor.secondGreenCard),
                                )),
                            Positioned(
                                top:
                                    -(MediaQuery.of(context).size.width / 2.9) /
                                        2,
                                right:
                                    -(MediaQuery.of(context).size.width / 2.9) /
                                        3.5,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width / 2.9,
                                  width:
                                      MediaQuery.of(context).size.width / 2.9,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: NewCustomColor.secondGreenCard),
                                )),
                            Container(
                              padding: EdgeInsets.fromLTRB(30, 14, 30, 23),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      "Jadwal Buka Pintu",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: NewCustomColor.primarygray,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom: 15, top: 15),
                                        padding: EdgeInsets.only(left: 20),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3.3,
                                        child: Center(
                                          child: DropdownButton<String>(
                                            hint: Text(
                                              "Jam",
                                              style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  color:
                                                      CustomColor.neutralBlack,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            underline: SizedBox(),
                                            value: jamOpen,
                                            icon: Icon(
                                              Icons.arrow_drop_down,
                                              color:
                                                  CustomColor.neutralLightGray,
                                            ),
                                            elevation: 16,
                                            style: TextStyle(
                                                color: CustomColor.neutralBlack,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                jamOpen = newValue!;
                                              });
                                            },
                                            items: hour
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom: 15, top: 15),
                                        padding: EdgeInsets.only(left: 20),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3.3,
                                        child: Center(
                                          child: DropdownButton<String>(
                                            hint: Text(
                                              "Menit",
                                              style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  color:
                                                      CustomColor.neutralBlack,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            underline: SizedBox(),
                                            value: menitOpen,
                                            icon: Icon(
                                              Icons.arrow_drop_down,
                                              color:
                                                  CustomColor.neutralLightGray,
                                            ),
                                            elevation: 16,
                                            style: TextStyle(
                                                color: CustomColor.neutralBlack,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                menitOpen = newValue!;
                                              });
                                            },
                                            items: minutes
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (!isProsesOpen) {
                                        setState(() {
                                          isProsesOpen = true;
                                        });
                                        PintuServices.changeOperasionalOpen(
                                                widget.key_pintu,
                                                jamOpen!,
                                                menitOpen!)
                                            .then((value) => setState(() {
                                                  isProsesOpen = false;
                                                }))
                                            .catchError((err) {
                                          setState(() {
                                            isProsesOpen = false;
                                          });
                                        });
                                      }
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 14),
                                      decoration: BoxDecoration(
                                          color: (jamOpen != null &&
                                                  menitOpen != null &&
                                                  !isProsesOpen)
                                              ? NewCustomColor.primaryBlue
                                              : Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.25),
                                              spreadRadius: 0,
                                              blurRadius: 4,
                                              offset: Offset(1, 1),
                                            ),
                                          ]),
                                      child: Text(
                                        !isProsesClose ? "Simpan" : "Proses",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: (jamOpen != null &&
                                                    menitOpen != null &&
                                                    !isProsesOpen)
                                                ? Colors.white
                                                : NewCustomColor.primaryBlue,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: NewCustomColor.bgCard,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ]),
                        child: Stack(
                          children: [
                            Positioned(
                                bottom:
                                    -(MediaQuery.of(context).size.width / 1.5) /
                                        2.7,
                                left:
                                    -(MediaQuery.of(context).size.width / 1.5) /
                                        4,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width / 1.5,
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: NewCustomColor.firstGreenCard),
                                )),
                            Positioned(
                                bottom:
                                    -(MediaQuery.of(context).size.width / 2.6) /
                                        2.3,
                                left: (MediaQuery.of(context).size.width / 5),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width / 2.6,
                                  width:
                                      MediaQuery.of(context).size.width / 2.6,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: NewCustomColor.secondGreenCard),
                                )),
                            Positioned(
                                top:
                                    -(MediaQuery.of(context).size.width / 2.9) /
                                        2,
                                right:
                                    -(MediaQuery.of(context).size.width / 2.9) /
                                        3.5,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width / 2.9,
                                  width:
                                      MediaQuery.of(context).size.width / 2.9,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: NewCustomColor.secondGreenCard),
                                )),
                            Container(
                              padding: EdgeInsets.fromLTRB(30, 14, 30, 23),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      "Jadwal Kunci Pintu",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          color: NewCustomColor.primarygray,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom: 15, top: 15),
                                        padding: EdgeInsets.only(left: 20),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3.3,
                                        child: Center(
                                          child: DropdownButton<String>(
                                            hint: Text(
                                              "Jam",
                                              style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  color:
                                                      CustomColor.neutralBlack,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            underline: SizedBox(),
                                            value: jamClose,
                                            icon: Icon(
                                              Icons.arrow_drop_down,
                                              color:
                                                  CustomColor.neutralLightGray,
                                            ),
                                            elevation: 16,
                                            style: TextStyle(
                                                color: CustomColor.neutralBlack,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                jamClose = newValue!;
                                              });
                                            },
                                            items: hour
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom: 15, top: 15),
                                        padding: EdgeInsets.only(left: 20),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3.3,
                                        child: Center(
                                          child: DropdownButton<String>(
                                            hint: Text(
                                              "Menit",
                                              style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  color:
                                                      CustomColor.neutralBlack,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            underline: SizedBox(),
                                            value: menitClose,
                                            icon: Icon(
                                              Icons.arrow_drop_down,
                                              color:
                                                  CustomColor.neutralLightGray,
                                            ),
                                            elevation: 16,
                                            style: TextStyle(
                                                color: CustomColor.neutralBlack,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                menitClose = newValue!;
                                              });
                                            },
                                            items: minutes
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (!isProsesClose) {
                                        setState(() {
                                          isProsesClose = true;
                                        });
                                        PintuServices.changeOperasionalClose(
                                                widget.key_pintu,
                                                jamClose!,
                                                menitClose!)
                                            .then((value) => setState(() {
                                                  isProsesClose = false;
                                                }))
                                            .catchError((err) {
                                          setState(() {
                                            isProsesClose = false;
                                          });
                                        });
                                      }
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 14),
                                      decoration: BoxDecoration(
                                          color: (jamClose != null &&
                                                  menitClose != null &&
                                                  !isProsesClose)
                                              ? NewCustomColor.primaryBlue
                                              : Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.25),
                                              spreadRadius: 0,
                                              blurRadius: 4,
                                              offset: Offset(1, 1),
                                            ),
                                          ]),
                                      child: Text(
                                        !isProsesClose ? "Simpan" : "Proses",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: (jamClose != null &&
                                                    menitClose != null &&
                                                    !isProsesClose)
                                                ? Colors.white
                                                : NewCustomColor.primaryBlue,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
