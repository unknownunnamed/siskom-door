import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/ui/widgets/custom_appbar.dart';
import 'package:sisdoor/ui/widgets/custom_password_form.dart';
import 'package:sisdoor/ui/widgets/custom_text_form.dart';

class EditPengguna extends StatefulWidget {
  const EditPengguna({Key? key}) : super(key: key);

  @override
  State<EditPengguna> createState() => _EditPenggunaState();
}

class _EditPenggunaState extends State<EditPengguna> {
  TextEditingController namaController =
      TextEditingController(text: "Tengku Nopriyanti Murti");
  TextEditingController noHPController = TextEditingController(text: "08");
  TextEditingController emailController =
      TextEditingController(text: "Tengkunopri@gmail.com");
  TextEditingController passwordController = TextEditingController(text: "123");

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
                CustomTextField(
                  controller: emailController,
                  label: "Email",
                  inputType: TextInputType.emailAddress,
                ),
                CustomPasswordForm(
                    controller: passwordController, label: "Password"),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {},
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
