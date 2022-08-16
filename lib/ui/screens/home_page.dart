import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/services/pintu_services.dart';

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
                    child: Container(
                        width: 41,
                        height: 41,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Center(
                          child: Icon(
                            Icons.logout_outlined,
                            size: 12,
                            color: NewCustomColor.thirdGreen,
                          ),
                        ))),
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
                padding: EdgeInsets.fromLTRB(30, 25, 30, 5),
                decoration: BoxDecoration(
                    color: NewCustomColor.bgGreen,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(60))),
                // child: ListView(
                //   children: menu
                //       .map((e) => GestureDetector(
                //             // onTap: e[2],
                //             child: Container(
                //               padding: EdgeInsets.symmetric(
                //                   horizontal: 20, vertical: 20),
                //               margin: EdgeInsets.only(bottom: 20),
                //               width: MediaQuery.of(context).size.width,
                //               decoration: BoxDecoration(
                //                   color: CustomColor.neutralWhite,
                //                   borderRadius: BorderRadius.all(
                //                       Radius.circular(20)),
                //                   boxShadow: [
                //                     BoxShadow(
                //                       color: CustomColor.neutralGray
                //                           .withOpacity(0.15),
                //                       spreadRadius: 0,
                //                       blurRadius: 10,
                //                       offset: Offset(0, 0),
                //                     ),
                //                   ]),
                //               child: Row(
                //                 children: [
                //                   Icon(
                //                     e[0],
                //                     color: CustomColor.neutralGray,
                //                     size: 40,
                //                   ),
                //                   SizedBox(
                //                     width: 20,
                //                   ),
                //                   SizedBox(
                //                     width: MediaQuery.of(context)
                //                             .size
                //                             .width /
                //                         (5 / 3),
                //                     child: Text(
                //                       e[1],
                //                       style: TextStyle(
                //                           color: CustomColor.neutralGray,
                //                           fontSize: 16,
                //                           fontWeight: FontWeight.w500),
                //                     ),
                //                   )
                //                 ],
                //               ),
                //             ),
                //           ))
                //       .toList(),
                // ),
              )
            ])
          ],
        ));
  }
}
