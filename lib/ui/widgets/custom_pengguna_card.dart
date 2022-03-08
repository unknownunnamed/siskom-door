import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';

class CustomPenggunaCard extends StatelessWidget {
  final String nama, email;
  const CustomPenggunaCard({Key? key, required this.nama, required this.email})
      : super(key: key);

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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(nama,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: CustomColor.neutralBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(email,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: CustomColor.neutralGray,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: CustomColor.secondaryTorea, shape: BoxShape.circle),
                child: Center(
                  child: Icon(
                    Icons.edit,
                    size: 15,
                    color: CustomColor.neutralWhite,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
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
              )
            ],
          )
        ],
      ),
    );
  }
}
