import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';

AppBar customAppbar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: CustomColor.neutralWhite,
    elevation: 0,
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back_ios_new,
        size: 25,
        color: CustomColor.neutralBlack,
      ),
    ),
    title: Text(
      title,
      style: TextStyle(color: CustomColor.neutralBlack),
    ),
  );
}
