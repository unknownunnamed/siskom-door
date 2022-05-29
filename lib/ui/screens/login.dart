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
  List<String> mapAccount = ["user", "admin"];
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
                    children: [
                      Text(
                        "Welcome !",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: CustomColor.secondaryGold,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Login to your account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: CustomColor.neutralGray,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: emailController,
                        label: "Email",
                      ),
                      CustomPasswordForm(
                          controller: passwordController, label: "Password"),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        padding: EdgeInsets.only(left: 20, right: 30),
                        decoration: BoxDecoration(
                            color: CustomColor.neutralLightGray,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          hint: Text(
                            "Status Akun",
                            style: TextStyle(
                                color: CustomColor.neutralBlack,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          underline: SizedBox(),
                          value: dropdownValue,
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
                              dropdownValue = newValue!;
                            });
                          },
                          items: mapAccount
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          AuthFirebase.signIn(
                                  emailController.text,
                                  passwordController.text,
                                  dropdownValue == 'admin' ? "1" : "0")
                              .then((value) => Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          dropdownValue == 'admin'
                                              ? HomeAdmin()
                                              : HomeUser()),
                                  (route) => false))
                              .catchError((err) => showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    customErrorModal(context,
                                        "Terjadi kesalahan")));
                        },
                        child: Container(
                            // margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            decoration: BoxDecoration(
                                color: CustomColor.secondaryGreen,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            child: Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: CustomColor.neutralWhite,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      )
                    ],
                  ),
                )
              ])
            ],
          )),
    );
  }
}
