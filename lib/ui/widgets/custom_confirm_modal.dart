import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';

AlertDialog customConfirmModal(context, void Function() confirm) {
  return AlertDialog(
    content: Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                "Apakah anda yakin ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: NewCustomColor.primarygray,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                    // margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 2, color: NewCustomColor.firstRed),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: Text(
                      "Tidak",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: NewCustomColor.firstRed,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: confirm,
                child: Container(
                    // margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        color: NewCustomColor.firstRed,
                        border: Border.all(
                            width: 2, color: NewCustomColor.firstRed),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: Text(
                      "Ya",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
