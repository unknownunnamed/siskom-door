import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/services/pintu_services.dart';
import 'package:sisdoor/ui/widgets/custom_text_form.dart';

AlertDialog customTambahPintulModal(context) {
  TextEditingController namaRuanganController = TextEditingController();
  return AlertDialog(
    content: Container(
      height: 140,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
              controller: namaRuanganController, label: 'Nama Ruangan'),
          GestureDetector(
            onTap: () async {
              await PintuServices.addPintu(namaRuanganController.text);
              Navigator.pop(context);
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: NewCustomColor.bgGreenButton,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Text(
                  "Tambah",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                )),
          )
        ],
      ),
    ),
  );
}
