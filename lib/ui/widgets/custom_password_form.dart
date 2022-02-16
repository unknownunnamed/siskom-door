import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';

class CustomPasswordForm extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  const CustomPasswordForm(
      {Key? key, required this.controller, required this.label})
      : super(key: key);

  @override
  State<CustomPasswordForm> createState() => _CustomPasswordFormState();
}

class _CustomPasswordFormState extends State<CustomPasswordForm> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: CustomColor.neutralLightGray,
          borderRadius: BorderRadius.all(Radius.circular(100))),
      child: TextFormField(
        controller: widget.controller,
        obscureText: !isShow,
        style: TextStyle(
            color: CustomColor.neutralBlack,
            fontSize: 16,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isShow = !isShow;
                });
              },
              child: Icon(
                isShow
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                size: 18,
                color: CustomColor.neutralBlack,
              ),
            ),
            hintText: widget.label,
            hintStyle: TextStyle(
                color: CustomColor.neutralBlack,
                fontSize: 16,
                fontWeight: FontWeight.w400),
            border: InputBorder.none),
      ),
    );
  }
}
