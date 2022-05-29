import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/services/rfid_services.dart';
import 'package:sisdoor/services/user_services.dart';
import 'package:sisdoor/ui/widgets/custom_appbar.dart';
import 'package:sisdoor/ui/widgets/custom_password_form.dart';
import 'package:sisdoor/ui/widgets/custom_text_form.dart';

class TambahPengguna extends StatefulWidget {
  const TambahPengguna({Key? key}) : super(key: key);

  @override
  State<TambahPengguna> createState() => _TambahPenggunaState();
}

class _TambahPenggunaState extends State<TambahPengguna> {
  TextEditingController namaController = TextEditingController();
  TextEditingController noHPController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<String> mapRFID = [];
  String? rfid;
  String? dropdownValue;

  void initData() async {
    RFIDServices.ref.orderByChild('status').equalTo(0).onValue.listen((event) {
      setState(() {
        mapRFID = event.snapshot.children.map((e) => e.key.toString()).toList();
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
        appBar: customAppbar(context, "Tambah Pengguna"),
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              children: [
                Text(
                  "Tambah Pengguna",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: CustomColor.secondaryGold,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Masukkan data dengan baik dan benar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: CustomColor.neutralGray,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextField(controller: namaController, label: "Nama"),
                CustomTextField(
                    controller: noHPController,
                    inputType: TextInputType.number,
                    label: "Nomor HP"),
                CustomTextField(
                  controller: emailController,
                  label: "Email",
                  inputType: TextInputType.emailAddress,
                ),
                CustomPasswordForm(
                    controller: passwordController, label: "Password"),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.only(left: 20, right: 30),
                  decoration: BoxDecoration(
                      color: CustomColor.neutralLightGray,
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: Text(
                      "Pilih RFID",
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
                      RFIDServices.ref
                          .orderByKey()
                          .equalTo(newValue)
                          .onValue
                          .listen((event) {
                        setState(() {
                          rfid = event.snapshot.children
                              .toList()[0]
                              .child('ID')
                              .value
                              .toString();
                        });
                      });
                    },
                    items:
                        mapRFID.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    UserServices.addUser(
                            emailController.text,
                            passwordController.text,
                            rfid!,
                            noHPController.text,
                            namaController.text)
                        .then((value) => Navigator.pop(context))
                        .catchError((err) => print(err));
                  },
                  child: Container(
                      // margin: EdgeInsets.only(top: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                          color: CustomColor.secondaryGreen,
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: Text(
                        "Tambah",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: CustomColor.neutralWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                )
              ],
            )));
  }
}
