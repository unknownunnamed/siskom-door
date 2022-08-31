import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sisdoor/config/custom_color.dart';

AlertDialog customErrorModal(context, String text) {
  return AlertDialog(
    content: Container(
      height: 420,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Lottie.asset("assets/lotties/error.json", repeat: false)),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                "Akses Ditolak",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: NewCustomColor.firstRed,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: NewCustomColor.primarygray,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                    color: NewCustomColor.firstRed,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: Text(
                  "Oke",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                )),
          ),
        ],
      ),
    ),
  );
}
