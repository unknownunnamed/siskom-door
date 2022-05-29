import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/services/rfid_services.dart';
import 'package:sisdoor/services/user_services.dart';
import 'package:sisdoor/ui/widgets/custom_appbar.dart';
import 'package:sisdoor/ui/widgets/custom_text_form.dart';

class EditPengguna extends StatefulWidget {
  final DataSnapshot dataUser;
  const EditPengguna({Key? key, required this.dataUser}) : super(key: key);

  @override
  State<EditPengguna> createState() => _EditPenggunaState();
}

class _EditPenggunaState extends State<EditPengguna> {
  TextEditingController namaController = TextEditingController();
  TextEditingController noHPController = TextEditingController();

  String? rfid;
  String? rfidOld;
  String? dropdownValue;
  List<String> mapRFID = [];

  void initData() async {
    namaController = TextEditingController(
        text: widget.dataUser.child('nama').value.toString());
    noHPController = TextEditingController(
        text: widget.dataUser.child('noHP').value.toString());
    rfid = widget.dataUser.child('idkartu').value.toString();
    RFIDServices.ref.orderByChild('status').equalTo(0).onValue.listen((event) {
      setState(() {
        mapRFID = event.snapshot.children.map((e) => e.key.toString()).toList();
      });
    });
    RFIDServices.ref
        .orderByChild('ID')
        .equalTo(widget.dataUser.child('idkartu').value.toString())
        .onValue
        .listen((event) {
      setState(() {
        rfidOld = event.snapshot.children.toList()[0].key.toString();
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
        appBar: customAppbar(context, "Edit Pengguna"),
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              children: [
                Text(
                  "Edit Pengguna",
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
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.only(left: 20, right: 30),
                  decoration: BoxDecoration(
                      color: CustomColor.neutralLightGray,
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: Text(
                      rfidOld ?? '',
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
                  onTap: () async {
                    await UserServices.updateUser(
                        widget.dataUser.child('idkartu').value.toString(),
                        rfid!,
                        noHPController.text,
                        namaController.text,
                        widget.dataUser.key.toString());
                    Navigator.pop(context);
                  },
                  child: Container(
                      // margin: EdgeInsets.only(top: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                          color: CustomColor.secondaryTorea,
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: Text(
                        "Edit",
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
