import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/services/pintu_services.dart';

class CustomDoorCard extends StatelessWidget {
  final DataSnapshot dataPintu;
  const CustomDoorCard({Key? key, required this.dataPintu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: EdgeInsets.only(bottom: 10, left: 30, right: 30),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: CustomColor.neutralWhite,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: CustomColor.neutralGray.withOpacity(0.15),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, 0),
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Text(dataPintu.key.toString(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: CustomColor.neutralBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
          ),
          GestureDetector(
            onTap: () async {
              PintuServices.deletePintu(dataPintu.key.toString());
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: CustomColor.primaryRose, shape: BoxShape.circle),
              child: Center(
                child: Icon(
                  Icons.delete,
                  size: 15,
                  color: CustomColor.neutralWhite,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
