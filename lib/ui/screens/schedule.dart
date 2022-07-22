import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/services/pintu_services.dart';
import 'package:sisdoor/ui/widgets/custom_appbar.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

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

  String? ruangan, jamOpen, menitOpen, jamClose, menitClose;

  List<String> dataPintu = [];

  void initData() async {
    PintuServices.ref.onValue.listen((event) {
      setState(() {
        dataPintu =
            event.snapshot.children.map((e) => e.key.toString()).toList();
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
      appBar: customAppbar(context, "Atur Jadwal Operasional"),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.only(left: 20, right: 30),
              decoration: BoxDecoration(
                  color: CustomColor.neutralLightGray,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: DropdownButton<String>(
                isExpanded: true,
                hint: Text(
                  "Pilih Ruangan",
                  style: TextStyle(
                      color: CustomColor.neutralBlack,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                underline: SizedBox(),
                value: ruangan,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: CustomColor.neutralBlack,
                ),
                elevation: 16,
                style: TextStyle(
                    color: CustomColor.neutralBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                onChanged: (String? newValue) {
                  setState(() {
                    ruangan = newValue!;
                  });
                },
                items: dataPintu.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value.toUpperCase()),
                  );
                }).toList(),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              margin: EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: CustomColor.neutralWhite,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: CustomColor.neutralGray.withOpacity(0.15),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    ),
                  ]),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Jadwal Buka Pintu",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: CustomColor.neutralGray,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 15, top: 15),
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            color: CustomColor.neutralLightGray,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        width: MediaQuery.of(context).size.width / 3.3,
                        child: Center(
                          child: DropdownButton<String>(
                            hint: Text(
                              "Jam",
                              style: TextStyle(
                                  color: CustomColor.neutralBlack,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                            underline: SizedBox(),
                            value: jamOpen,
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: CustomColor.neutralLightGray,
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
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 15, top: 15),
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            color: CustomColor.neutralLightGray,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        width: MediaQuery.of(context).size.width / 3.3,
                        child: Center(
                          child: DropdownButton<String>(
                            hint: Text(
                              "Menit",
                              style: TextStyle(
                                  color: CustomColor.neutralBlack,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                            underline: SizedBox(),
                            value: menitOpen,
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: CustomColor.neutralLightGray,
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
                                .map<DropdownMenuItem<String>>((String value) {
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
                                ruangan!, jamOpen!, menitOpen!)
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
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: (ruangan != null &&
                                  jamOpen != null &&
                                  menitOpen != null && !isProsesOpen)
                              ? CustomColor.secondaryGreen
                              : CustomColor.neutralWhite,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: CustomColor.neutralGray.withOpacity(0.15),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset: Offset(0, 0),
                            ),
                          ]),
                      child: Text(
                        !isProsesOpen ? "Simpan" : "Proses",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: (ruangan != null &&
                                    jamOpen != null &&
                                    menitOpen != null)
                                ? CustomColor.neutralWhite
                                : CustomColor.neutralGray,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              margin: EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: CustomColor.neutralWhite,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: CustomColor.neutralGray.withOpacity(0.15),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    ),
                  ]),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Jadwal Kunci Pintu",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: CustomColor.neutralGray,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 15, top: 15),
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            color: CustomColor.neutralLightGray,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        width: MediaQuery.of(context).size.width / 3.3,
                        child: Center(
                          child: DropdownButton<String>(
                            hint: Text(
                              "Jam",
                              style: TextStyle(
                                  color: CustomColor.neutralBlack,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                            underline: SizedBox(),
                            value: jamClose,
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: CustomColor.neutralLightGray,
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
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 15, top: 15),
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            color: CustomColor.neutralLightGray,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        width: MediaQuery.of(context).size.width / 3.3,
                        child: Center(
                          child: DropdownButton<String>(
                            hint: Text(
                              "Menit",
                              style: TextStyle(
                                  color: CustomColor.neutralBlack,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                            underline: SizedBox(),
                            value: menitClose,
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: CustomColor.neutralLightGray,
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
                                .map<DropdownMenuItem<String>>((String value) {
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
                                ruangan!, jamClose!, menitClose!)
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
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: (ruangan != null &&
                                  jamClose != null &&
                                  menitClose != null &&
                                  !isProsesClose)
                              ? CustomColor.secondaryGreen
                              : CustomColor.neutralWhite,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: CustomColor.neutralGray.withOpacity(0.15),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset: Offset(0, 0),
                            ),
                          ]),
                      child: Text(
                        !isProsesClose ? "Simpan" : "Proses",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: (ruangan != null &&
                                    jamClose != null &&
                                    menitClose != null)
                                ? CustomColor.neutralWhite
                                : CustomColor.neutralGray,
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
    );
  }
}
