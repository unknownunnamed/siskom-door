import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/services/firebase_auth.dart';
import 'package:sisdoor/ui/screens/door.dart';
import 'package:sisdoor/ui/screens/home_page.dart';
import 'package:sisdoor/ui/screens/kendali_pintu.dart';
import 'package:sisdoor/ui/screens/login.dart';
import 'package:sisdoor/ui/screens/aktivitas_pengguna.dart';
import 'package:sisdoor/ui/screens/pengguna.dart';
import 'package:sisdoor/ui/screens/schedule.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({Key? key}) : super(key: key);

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    List<List<dynamic>> menu = [
      [
        'home.png',
        'home_active.png',
        "Beranda",
        HomePage()
        // () {
        //   Navigator.push(
        //       context, MaterialPageRoute(builder: (context) => Schedule()));
        // }
      ],
      [
        'jadwal.png',
        'jadwal_active.png',
        "Aktivitas Pengguna",
        AktivitasPengguna()
        // () {
        //   Navigator.push(context,
        //       MaterialPageRoute(builder: (context) => AktivitasPengguna()));
        // }
      ],
      [
        'pengguna.png',
        'pengguna_active.png',
        "Data Pengguna",
        Pengguna()
        // () {
        //   Navigator.push(
        //       context, MaterialPageRoute(builder: (context) => Pengguna()));
        // }
      ],
      [
        'pintu.png',
        'pintu_active.png',
        "Data Ruangan",
        Door()
        // () {
        //   Navigator.push(
        //       context, MaterialPageRoute(builder: (context) => Door()));
        // }
      ],
      // [
      //   Icons.logout,
      //   "Logout",
      //   () async {
      //     await AuthFirebase.signOut();
      //     Navigator.pushAndRemoveUntil(
      //         context,
      //         MaterialPageRoute(builder: (context) => Login()),
      //         (route) => false);
      //   }
      // ]
    ];

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: CustomColor.neutralWhite,
      body: Column(
        children: [
          menu[index][3],
          Container(
            width: MediaQuery.of(context).size.width,
            height: 85,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  offset: Offset(0, -5),
                  blurRadius: 22,
                  spreadRadius: 0)
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: menu
                  .asMap()
                  .entries
                  .map((e) => GestureDetector(
                        onTap: () {
                          setState(() {
                            index = e.key;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(
                                  'assets/images/${(index == e.key) ? e.value[1] : e.value[0]}'),
                              height: 23.33,
                            ),
                            SizedBox(
                              height: 11,
                            ),
                            Text(
                              e.value[2],
                              style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w500,
                                  color: index == e.key
                                      ? NewCustomColor.firstGradientGreenColor
                                      : NewCustomColor.thirdgray),
                            )
                          ],
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
