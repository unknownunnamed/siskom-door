import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/services/rfid_services.dart';
import 'package:sisdoor/services/user_services.dart';
import 'package:sisdoor/ui/widgets/custom_password_form.dart';
import 'package:sisdoor/ui/widgets/custom_success_modal.dart';
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
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(children: [
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
                          'TAMBAH PENGGUNA',
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
                      padding: EdgeInsets.symmetric(vertical: 29),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height -
                          105 -
                          MediaQuery.of(context).viewInsets.bottom,
                      child: ListView(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        children: [
                          Text(
                            "Tambah Pengguna",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Inter',
                                color: NewCustomColor.primaryGreen,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Masukkan data dengan baik dan benar",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Inter',
                                color: NewCustomColor.primarygray,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(top: 19),
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              color: NewCustomColor.bgCard,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                    bottom:
                                        -(MediaQuery.of(context).size.width /
                                                1.15) /
                                            4,
                                    left: -(MediaQuery.of(context).size.width /
                                            1.15) /
                                        3,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.width /
                                              1.15,
                                      width: MediaQuery.of(context).size.width /
                                          1.15,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: NewCustomColor.firstGreenCard),
                                    )),
                                Positioned(
                                    bottom:
                                        -(MediaQuery.of(context).size.width /
                                                2.06) /
                                            3,
                                    left:
                                        (MediaQuery.of(context).size.width / 5),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.width /
                                              2.06,
                                      width: MediaQuery.of(context).size.width /
                                          2.06,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              NewCustomColor.secondGreenCard),
                                    )),
                                Positioned(
                                    top: -(MediaQuery.of(context).size.width /
                                            5) /
                                        2,
                                    right: -(MediaQuery.of(context).size.width /
                                            2.3) /
                                        3.5,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.width /
                                              2.3,
                                      width: MediaQuery.of(context).size.width /
                                          2.3,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              NewCustomColor.secondGreenCard),
                                    )),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 23, vertical: 10),
                                  child: ListView(
                                    shrinkWrap: true,
                                    physics: ClampingScrollPhysics(),
                                    children: [
                                      CustomTextField(
                                          controller: namaController,
                                          label: "Nama"),
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
                                          controller: passwordController,
                                          label: "Password"),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 18),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        child: DropdownButton<String>(
                                          isExpanded: true,
                                          hint: Text(
                                            "Pilih RFID",
                                            style: TextStyle(
                                                fontFamily: 'Inter',
                                                color:
                                                    NewCustomColor.primarygray,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          underline: SizedBox(),
                                          value: dropdownValue,
                                          icon: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: Icon(
                                              Icons.expand_more,
                                              color: NewCustomColor.primarygray,
                                            ),
                                          ),
                                          elevation: 16,
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              color: NewCustomColor.primarygray,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
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
                                          items: mapRFID
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (emailController.text != "" &&
                                              passwordController.text != "" &&
                                              rfid != null &&
                                              noHPController.text != "" &&
                                              namaController.text != "") {
                                            UserServices.addUser(
                                                    emailController.text,
                                                    passwordController.text,
                                                    rfid!,
                                                    noHPController.text,
                                                    namaController.text)
                                                .then((value) =>
                                                    Navigator.pop(context))
                                                .then((value) => showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        customSuccessModal(
                                                            context,
                                                            'Data berhasil ditambah')));
                                          }
                                        },
                                        child: Container(
                                            margin: EdgeInsets.only(bottom: 18),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 15),
                                            decoration: BoxDecoration(
                                                color:
                                                    NewCustomColor.primaryBlue,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.25),
                                                      offset: Offset(1, 1),
                                                      blurRadius: 4,
                                                      spreadRadius: 0)
                                                ]),
                                            child: Text(
                                              "Tambah",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ],
              )
            ])));
  }
}
