import 'package:flutter/material.dart';
import 'package:sisdoor/config/custom_color.dart';
import 'package:sisdoor/ui/widgets/custom_jam_operasional_modal.dart';

class CustomKendaliCard extends StatelessWidget {
  final String ruangan, open, close;
  final bool isOpen, isLock;
  const CustomKendaliCard(
      {Key? key,
      required this.ruangan,
      required this.isOpen,
      required this.isLock,
      required this.open,
      required this.close})
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                isLock ? Icons.lock_outline : Icons.lock_open_outlined,
                color: isLock
                    ? CustomColor.primaryRose
                    : CustomColor.secondaryGreen,
                size: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Text(ruangan,
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: CustomColor.neutralBlack,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Pintu ${isOpen ? "Terbuka" : "Tertutup"}",
                      style: TextStyle(
                          color: CustomColor.neutralGray,
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          customJamOperasionalModal(context, open, close));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: CustomColor.secondaryGreen,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColor.neutralGray.withOpacity(0.15),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: Offset(0, 0),
                        ),
                      ]),
                  child: Text(
                    "Lihat Jam Operasional",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: CustomColor.neutralWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
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
