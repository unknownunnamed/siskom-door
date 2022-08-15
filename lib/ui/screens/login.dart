import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/services/firebase_auth.dart';
import 'package:sisdoor/ui/screens/home_admin.dart';
import 'package:sisdoor/ui/screens/home_user.dart';
import 'package:sisdoor/ui/widgets/custom_error_modal.dart';
import 'package:sisdoor/ui/widgets/custom_password_form.dart';
import 'package:sisdoor/ui/widgets/custom_text_form.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
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
                  )
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
                  padding: EdgeInsets.fromLTRB(30, 25, 30, 5),
                  decoration: BoxDecoration(
                      color: CustomColor.neutralWhite,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(60))),
                  child: ListView(
                    children: [
                      Text(
                        "Selamat Datang",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Inter',
                            color: NewCustomColor.primaryGreen,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Silahkan login akun anda",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Inter',
                            color: NewCustomColor.primarygray,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(bottom: 42),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: NewCustomColor.bgCard,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.25),
                                        offset: Offset(0, 4),
                                        blurRadius: 4,
                                        spreadRadius: 0)
                                  ]),
                              child: Stack(children: [
                                Positioned(
                                    bottom:
                                        -(MediaQuery.of(context).size.width /
                                                1.5) /
                                            3,
                                    left: -(MediaQuery.of(context).size.width /
                                            1.5) /
                                        4,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.width /
                                              1.5,
                                      width: MediaQuery.of(context).size.width /
                                          1.5,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: NewCustomColor.firstGreenCard),
                                    )),
                                Positioned(
                                    bottom:
                                        -(MediaQuery.of(context).size.width /
                                                2.6) /
                                            2.5,
                                    left:
                                        (MediaQuery.of(context).size.width / 5),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.width /
                                              2.6,
                                      width: MediaQuery.of(context).size.width /
                                          2.6,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              NewCustomColor.secondGreenCard),
                                    )),
                                Positioned(
                                    top: -(MediaQuery.of(context).size.width /
                                            2.9) /
                                        2,
                                    right: -(MediaQuery.of(context).size.width /
                                            2.9) /
                                        3.5,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.width /
                                              2.9,
                                      width: MediaQuery.of(context).size.width /
                                          2.9,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              NewCustomColor.secondGreenCard),
                                    )),
                                Container(
                                  padding: EdgeInsets.fromLTRB(23, 23, 23, 54),
                                  child: Column(
                                    children: [
                                      CustomTextField(
                                        controller: emailController,
                                        label: "Email",
                                      ),
                                      CustomPasswordForm(
                                          controller: passwordController,
                                          label: "Password"),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                width: MediaQuery.of(context).size.width - 60,
                                padding: EdgeInsets.only(bottom: 10),
                                child: Center(
                                  child: Container(
                                    height: 64,
                                    width: 64,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.25),
                                              offset: Offset(0, 4),
                                              blurRadius: 4,
                                              spreadRadius: 0)
                                        ]),
                                    child: Center(
                                      child: Icon(
                                        Icons.arrow_forward,
                                        size: 24,
                                        color: NewCustomColor.secondGreen,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      // CustomTextField(
                      //   controller: emailController,
                      //   label: "Email",
                      // ),
                      // CustomPasswordForm(
                      //     controller: passwordController, label: "Password"),
                      // GestureDetector(
                      //   onTap: () {
                      //     AuthFirebase.signIn(
                      //             emailController.text, passwordController.text)
                      //         .then((value) => Navigator.pushAndRemoveUntil(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (context) => value == '1'
                      //                     ? HomeAdmin()
                      //                     : HomeUser()),
                      //             (route) => false))
                      //         .catchError((err) => showDialog(
                      //             context: context,
                      //             builder: (BuildContext context) =>
                      //                 customErrorModal(
                      //                     context, "Terjadi kesalahan")));
                      //   },
                      //   child: Container(
                      //       // margin: EdgeInsets.only(top: 20),
                      //       padding: EdgeInsets.symmetric(
                      //           horizontal: 20, vertical: 15),
                      //       decoration: BoxDecoration(
                      //           color: CustomColor.secondaryGreen,
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(100))),
                      //       child: Text(
                      //         "Login",
                      //         textAlign: TextAlign.center,
                      //         style: TextStyle(
                      //           color: CustomColor.neutralWhite,
                      //           fontSize: 20,
                      //           fontWeight: FontWeight.w500,
                      //         ),
                      //       )),
                      // )
                    ],
                  ),
                )
              ])
            ],
          )),
    );
  }
}
