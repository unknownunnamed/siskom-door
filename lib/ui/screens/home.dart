import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/ui/screens/login.dart';
import 'package:sisdoor/ui/screens/schedule.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<dynamic>> menu = [
      [
        Icons.lock_clock,
        "Atur Jadwal Operasional",
        () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Schedule()));
        }
      ],
      [Icons.room_preferences, "Monitoring dan Kendali Pintu", () {}],
      [Icons.data_usage, "Data Pengguna", () {}],
      [
        Icons.logout,
        "Logout",
        () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Login()),
              (route) => false);
        }
      ]
    ];

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: CustomColor.neutralWhite,
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
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Sistem Kendali dan Monitoring Keamanan Pintu",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: CustomColor.neutralWhite),
                  ),
                ),
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
                  padding: EdgeInsets.fromLTRB(30, 25, 30, 5),
                  decoration: BoxDecoration(
                      color: CustomColor.neutralWhite,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(60))),
                  child: ListView(
                    children: menu
                        .map((e) => GestureDetector(
                              onTap: e[2],
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                margin: EdgeInsets.only(bottom: 20),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: CustomColor.neutralWhite,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: CustomColor.neutralGray
                                            .withOpacity(0.15),
                                        spreadRadius: 0,
                                        blurRadius: 10,
                                        offset: Offset(0, 0),
                                      ),
                                    ]),
                                child: Row(
                                  children: [
                                    Icon(
                                      e[0],
                                      color: CustomColor.neutralGray,
                                      size: 40,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          (5 / 3),
                                      child: Text(
                                        e[1],
                                        style: TextStyle(
                                            color: CustomColor.neutralGray,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                )
              ])
            ],
          )),
    );
  }
}
