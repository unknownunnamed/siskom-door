import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';

AlertDialog customJamOperasionalModal(context, open, close) {
  return AlertDialog(
    content: Container(
      height: 150,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Text(
                "Jam Operasional",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: NewCustomColor.primarygray,
                    fontWeight: FontWeight.w600,
                    fontSize: 24),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: NewCustomColor.thirdgray,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  open,
                  style: TextStyle(color: NewCustomColor.primarygray, fontSize: 18),
                ),
                Text(
                  '-',
                  style: TextStyle(color: NewCustomColor.primarygray, fontSize: 18),
                ),
                Text(
                  close,
                  style: TextStyle(color: NewCustomColor.primarygray, fontSize: 18),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
