import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const CustomTextField(
      {Key? key, required this.controller, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: CustomColor.neutralLightGray,
          borderRadius: BorderRadius.all(Radius.circular(100))),
      child: TextFormField(
        controller: controller,
        style: TextStyle(
            color: CustomColor.secondaryGold,
            fontSize: 16,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          hintText: label,
          hintStyle: TextStyle(
              color: CustomColor.neutralBlack,
              fontSize: 16,
              fontWeight: FontWeight.w400),
              border: InputBorder.none
        ),
      ),
    );
  }
}
